FROM python:3.11-slim

# Evita arquivos .pyc e mantém logs visíveis
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Dependências do sistema
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Dependências Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Código da aplicação
COPY app ./app
COPY GeoLite2-Country.mmdb ./GeoLite2-Country.mmdb

# Usuário não-root (boa prática)
RUN adduser --disabled-password --gecos "" appuser \
    && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

# Fallback (o docker-compose pode sobrescrever)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
