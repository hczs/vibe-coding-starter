# AGENTS.md

## Project overview
This repository is a Python application using:
- Python 3.11+
- uv for dependency and environment management
- Ruff for lint and format
- Pyright for type checking
- pytest for testing

## Commands
- Install deps: `uv sync` or `uv add`
- Run app: `uv run python -m app.main`
- Prefer defining a project entry under `[project.scripts]` in `pyproject.toml`, then run the app as `uv run <command>`
- Run tests: `uv run pytest`
- Lint: `uv run ruff check .`
- Format: `uv run ruff format .`
- Type check: `uv run pyright`

## Engineering rules
- Use `pyproject.toml` as the single source of tool configuration.
- Do not introduce `requirements.txt` unless explicitly requested.
- Prefer small, typed functions.
- New public functions must include type annotations.
- Keep business logic out of route handlers.
- Put configuration in `settings.py` or equivalent settings module.
- Prefer explicit error handling over broad except.

## Constraints
- Do not replace uv with pipenv/poetry/pip unless asked.
- Do not add new dependencies unless necessary.
- Do not modify unrelated files.
- Do not weaken tests to make them pass.
- Do not silence lint/type errors without explanation.

## Done criteria
A task is only complete when:
1. Code is updated minimally and coherently.
2. `uv run ruff check .` passes.
3. `uv run pyright` passes.
4. `uv run pytest` passes for impacted scope.
5. Briefly explain what changed and why.
