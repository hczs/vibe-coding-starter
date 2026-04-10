# AGENTS.md

## Project overview
This repository is a FastAPI application built with modern Python tooling.

Primary stack:
- Python 3.12+
- FastAPI
- Pydantic v2
- pydantic-settings
- SQLAlchemy 2.x
- Alembic
- uv
- Ruff
- Pyright
- pytest

## Project structure
Organize code by responsibility.

Expected layout:
- `src/app/main.py` — application entrypoint
- `src/app/api/` — routers, HTTP layer, API dependencies
- `src/app/core/` — config, logging, security, shared infrastructure
- `src/app/schemas/` — request/response schemas
- `src/app/models/` — ORM models
- `src/app/repositories/` — database access
- `src/app/services/` — business logic
- `src/app/db/` — engine, session management
- `tests/` — automated tests
- `migrations/` — Alembic migrations

## Core engineering rules
- Use `uv` for dependency and environment management.
- Use `pyproject.toml` as the single source of tool configuration whenever possible.
- Use Ruff for linting and formatting.
- Use Pyright for static type checking.
- Use pytest for tests.
- Keep changes minimal, local, and consistent with the existing architecture.
- Do not modify unrelated files.

## FastAPI architecture rules
- Keep route handlers thin.
- Route handlers should handle HTTP concerns only.
- Put business logic in `services/`.
- Put database access in `repositories/`.
- Do not place complex business logic in routers.
- Do not access the database directly from routers unless the task is explicitly trivial and consistent with existing code.
- Shared FastAPI dependencies should live in a dedicated dependencies module or equivalent location.

## Schema and typing rules
- All new public functions must have type annotations.
- Use explicit Pydantic schemas for request and response models.
- Do not expose ORM models directly as API response contracts.
- For important input schemas, prefer forbidding unexpected extra fields.
- Prefer small, cohesive functions over large multi-purpose functions.

## Database rules
- Use SQLAlchemy 2.x style only.
- Manage schema changes with Alembic migrations.
- Keep transaction boundaries clear.
- Prefer transaction control at the service layer rather than scattering commits across repositories.
- Do not hand-edit production schema assumptions into code without a migration.

## Configuration rules
- Centralize configuration in a settings module.
- Use environment variables through `pydantic-settings` or the repository’s existing settings pattern.
- Do not hardcode secrets, tokens, passwords, or environment-specific URLs.

## Logging rules
- Prefer the Python standard `logging` ecosystem by default.
- Keep logging configuration centralized.
- Include request-oriented context where appropriate, such as request id, user id, route, and error details.
- Do not replace the logging stack with a new library unless explicitly requested.

## Dependency rules
- Do not add new dependencies unless necessary.
- When adding a dependency, explain why the standard library or current stack is insufficient.
- Prefer mature, low-friction dependencies that fit the existing project direction.

## Testing rules
For any non-trivial change:
- Add or update tests for the affected behavior.
- Cover happy path, validation failures, and relevant edge cases.
- Do not weaken tests just to make them pass.
- Do not remove assertions without explaining why.

## Work process
Before coding:
1. Read the relevant files and existing patterns.
2. Propose a brief implementation plan for non-trivial tasks.
3. Identify assumptions and risks.

While coding:
1. Follow existing repository conventions first.
2. Avoid broad refactors unless explicitly requested.
3. Keep diffs reviewable.

After coding:
1. Run `uv sync` if needed.
2. Run `uv run ruff check .`
3. Run `uv run ruff format --check .`
4. Run `uv run pyright`
5. Run `uv run pytest`

## Output expectations
When finishing a task:
- Summarize which files changed.
- Explain the chosen approach briefly.
- Report validation commands run and their results.
- Mention any remaining risks, trade-offs, or follow-up work.

## Forbidden shortcuts
- Do not silently ignore lint or type errors.
- Do not introduce compatibility hacks without explanation.
- Do not bypass architecture boundaries for convenience.
- Do not rewrite large areas of code when a small targeted fix is enough.
- Do not add new framework layers or abstractions unless justified by the task.