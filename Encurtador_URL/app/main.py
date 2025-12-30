from fastapi import FastAPI, Depends, HTTPException, Request
from fastapi.responses import RedirectResponse, Response
from sqlalchemy.orm import Session
from pydantic import BaseModel
import string
import random
import geoip2.database

from app.database import Base, engine, get_db
from app.models import URL, Click
from app.analytics import generate_country_chart

app = FastAPI(title="URL Shortener")

GEOIP_DB_PATH = "./GeoLite2-Country.mmdb"


@app.on_event("startup")
def on_startup():
    """
    Cria as tabelas quando a aplicação inicia.
    """
    Base.metadata.create_all(bind=engine)


class URLCreate(BaseModel):
    original_url: str


class URLResponse(BaseModel):
    short_url: str


def generate_short_code(length: int = 6) -> str:
    chars = string.ascii_letters + string.digits
    return "".join(random.choice(chars) for _ in range(length))


@app.post("/shorten", response_model=URLResponse)
def shorten_url(data: URLCreate, request: Request, db: Session = Depends(get_db)):
    short_code = generate_short_code()

    while db.query(URL).filter(URL.short_code == short_code).first():
        short_code = generate_short_code()

    url = URL(
        original_url=data.original_url,
        short_code=short_code,
    )

    db.add(url)
    db.commit()
    db.refresh(url)

    base_url = str(request.base_url).rstrip("/")

    return {"short_url": f"{base_url}/{short_code}"}


@app.get("/analytics")
def analytics(db: Session = Depends(get_db)):
    """
    Gera gráfico de cliques por país com dados reais.
    """
    clicks = db.query(Click).all()
    country_count = {}

    with geoip2.database.Reader(GEOIP_DB_PATH) as reader:
        for click in clicks:
            try:
                response = reader.country(click.ip)
                country = response.country.iso_code or "Unknown"
            except:
                country = "Unknown"

            country_count[country] = country_count.get(country, 0) + 1

    buf = generate_country_chart(country_count)
    return Response(content=buf.getvalue(), media_type="image/png")


@app.get("/{short_code}")
def redirect_url(short_code: str, request: Request, db: Session = Depends(get_db)):
    url = db.query(URL).filter(URL.short_code == short_code).first()
    if not url:
        raise HTTPException(status_code=404, detail="URL not found")

    url.clicks += 1
    db.commit()

    click = Click(url_id=url.id, ip=request.client.host)
    db.add(click)
    db.commit()

    return RedirectResponse(url.original_url)
