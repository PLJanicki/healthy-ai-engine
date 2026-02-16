---
description: Project structure, tooling, data models, testing, error handling, and configuration conventions for healthy-ai-engine
globs: ["**/*.py", "**/pyproject.toml"]
---

# Python Project Conventions

## Project Overview

**healthy-ai-engine** is an open-source AI engine for high-performance fitness tracking and personalized health intelligence. All code should reflect production-quality standards appropriate for a health/fitness domain.

## Python Version & Environment

- **Python version**: 3.12+
- **Package manager**: `uv`
- **Project configuration**: `pyproject.toml` (all dependencies, tools, and metadata)
- **Virtual environment**: always work inside `.venv`

## Project Structure

```
healthy-ai-engine/
├── src/
│   └── healthy_ai_engine/    # Main package (importable as healthy_ai_engine)
│       ├── __init__.py
│       ├── agents/           # AI agents
│       ├── models/           # Data models (Pydantic)
│       ├── services/         # Business logic services
│       ├── utils/            # Shared utilities
│       └── config/           # Configuration management
├── tests/
│   ├── unit/
│   ├── integration/
│   └── conftest.py
├── pyproject.toml
└── README.md
```

## Data Models

- Use **Pydantic v2** (`BaseModel`) for all data models and validation
- Define models in `src/healthy_ai_engine/models/`
- Use `Field()` with descriptions for documenting model fields
- Example:

```python
from __future__ import annotations

from pydantic import BaseModel, Field


class HeartRateReading(BaseModel):
    """A single heart rate measurement."""

    bpm: int = Field(..., ge=30, le=250, description="Beats per minute")
    timestamp: datetime = Field(..., description="UTC timestamp of the reading")
    source: str = Field(default="manual", description="Data source identifier")
```

## Error Handling

- Define custom exceptions in a dedicated `exceptions.py` module
- Inherit from a project-level base exception: `class HealthyAIError(Exception)`
- Use specific exception types rather than generic `Exception`
- Always include meaningful error messages
- Use `logging` (not `print`) for diagnostic output

## Testing

- Use **pytest** as the testing framework
- Place tests in `tests/` mirroring the `src/` structure
- Name test files `test_<module>.py` and test functions `test_<behavior>()`
- Use **pytest fixtures** in `conftest.py` for shared setup
- Aim for meaningful test coverage — focus on business logic and edge cases
- Run tests with: `pytest tests/ -v`

## Type Checking

- Use **mypy** in strict mode for static type analysis
- Configure in `pyproject.toml`:

```toml
[tool.mypy]
strict = true
plugins = ["pydantic.mypy"]
```

- Fix all mypy errors before committing — do not use `type: ignore` without a justifying comment
- Use `typing` module constructs (`Optional`, `Union`, `Protocol`, etc.) as needed
- Run with: `mypy .`

## Async Code

- Use `async`/`await` for I/O-bound operations (API calls, database queries)
- Prefer `asyncio` for concurrency
- Use `httpx` (async) over `requests` for HTTP calls

## Configuration

- Use **environment variables** for secrets and deployment-specific settings
- Use **Pydantic Settings** (`pydantic-settings`) for configuration management
- Never hardcode secrets, API keys, or credentials
