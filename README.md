# MQTT BOILERPLATE

## Pre-requisites

- Python 3.13.x
- Poetry 2.0.x

## Tools and Frameworks

- [x] FastApi
- [x] Uvicorn
- [x] pytest
- [x] pre-commit
- [x] ruff

## Install dependencies

```
poetry install
```

## Commands

Start server
```
make up
```

Stop server
```
make down
```

Lint
```
make lint
```

Lint and fix
```
make lint-fix
```

Format
```
make format
```

Launch tests
```
make test
```

Launch test with coverage
```
make coverage
```

Run pre-commit hooks
```
make pre-commit
```