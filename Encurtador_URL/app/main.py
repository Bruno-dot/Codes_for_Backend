from fastapi import FastAPI, Request, Depends, HTTPException
from fastapi.responses import RedirectResponse
from sqlalchemy.orm import Session
import geoip2.database
import os

from .database import SessionLocal, engine
from .models import Base, URL, Click
from .utils import generate_short_code, get_device

# =========================
# Inicialização
# =========================

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Encurtador de URL com Analytics",
    version="1.0.0"
)

# =========================
# GeoIP
# =========================

GEOIP_DB_PATH = os.getenv(
    "GEOIP_DB_PATH",
    "GeoLite2-Country.mmdb"
)

geoip_reader = geoip2.database.Reader(GEOIP_DB_PATH)


# =========================
# Banco de dados
# =========================

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# =========================
# Rotas
# =========================

@app.post("/shorten")
def shorten_url(original_url: str, db: Session = Depends(get_db)):
    code = generate_short_code()

    url = URL(
        original_url=original_url,
        short_code=code
    )

    db.add(url)
    db.commit()
    db.refresh(url)

    return {
        "short_url": f"http://localhost:8000/{code}"
    }


@app.get("/{code}")
def redirect_to_original(
    code: str,
    request: Request,
    db: Session = Depends(get_db)
):
    url = db.query(URL).filter(URL.short_code == code).first()

    if not url:
        raise HTTPException(
            status_code=404,
            detail="URL não encontrada"
        )

    # =========================
    # User-Agent → Dispositivo
    # =========================
    user_agent = request.headers.get("user-agent", "")
    device = get_device(user_agent)

    # =========================
    # IP → País (GeoIP REAL)
    # =========================
    ip_address = request.client.host

    try:
        response = geoip_reader.country(ip_address)
        country = response.country.name or "Desconhecido"
    except Exception:
        country = "Desconhecido"

    # =========================
    # Registrar clique
    # =========================
    click = Click(
        url_id=url.id,
        country=country,
        device=device
    )

    db.add(click)
    db.commit()

    return RedirectResponse(url.original_url)


@app.get("/analytics/{code}")
def get_analytics(code: str, db: Session = Depends(get_db)):
    url = db.query(URL).filter(URL.short_code == code).first()

    if not url:
        raise HTTPException(
            status_code=404,
            detail="URL não encontrada"
        )

    countries = {}
    devices = {}

    for click in url.clicks:
        countries[click.country] = countries.get(click.country, 0) + 1
        devices[click.device] = devices.get(click.device, 0) + 1

    return {
        "short_code": code,
        "original_url": url.original_url,
        "total_clicks": len(url.clicks),
        "countries": countries,
        "devices": devices
    }
