.PHONY: help install up down test test-cov lint lint-fix format pre-commit

default: help

help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

install: # Install dependencies
	poetry install --no-root
	poetry run pre-commit install

up: # Start local server with docker for development
	cd docker && docker compose up --build

down: # Stop local server with docker for development
	cd docker && docker compose down --remove-orphans

test: # Run tests
ifdef filter
	cd docker && docker compose run --build --rm test poetry run pytest $(filter) -vv
else
	cd docker && docker compose run --build --rm test poetry run pytest -n 4 -vv
endif

test-cov: test # Run tests with coverage
	cd docker && docker compose run --build --rm test poetry run pytest -n 4 --cov-report term-missing --cov=app

lint: # Run linter
	cd docker && docker compose run --build --rm test poetry run ruff check .

lint-fix: # Run linter with fix
	cd docker && docker compose run --build --rm test poetry run ruff check --fix .

format: # Run formatter
	cd docker && docker compose run --build --rm test poetry run ruff format .

pre-commit: # Run pre-commit hooks
	poetry run pre-commit