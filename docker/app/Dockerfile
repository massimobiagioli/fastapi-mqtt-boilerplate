FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install poetry==2.0.1

RUN poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi --all-extras --no-root

RUN mkdir -p app tests

EXPOSE 8000