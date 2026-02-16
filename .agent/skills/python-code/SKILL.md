---
name: python-code
description: Guidelines and conventions for writing, reviewing, and maintaining Python code in the healthy-ai-engine project
---

# Python Code Skill

Use this skill whenever writing, reviewing, refactoring, or debugging Python code in this project.

## Communication Guidelines

- **Always explain your reasoning** — when writing, changing, or suggesting code, explain *why* you made that choice (e.g., why a particular pattern, data structure, or library was used).
- **Teach when correcting** — if you correct or rewrite code the user wrote, clearly explain what was wrong and why the new approach is better. Treat corrections as learning opportunities.
- **Don't silently change things** — never refactor, rename, or restructure code without calling out what changed and the reasoning behind it.

## Project Overview

**healthy-ai-engine** is an open-source AI engine for high-performance fitness tracking and personalized health intelligence. All code should reflect production-quality standards appropriate for a health/fitness domain.

## Python Version & Environment

- **Python version**: 3.12+
- **Package manager**: `uv`
- **Project configuration**: `pyproject.toml` (all dependencies, tools, and metadata)
- **Virtual environment**: always work inside `.venv`

## Code Style & Formatting

- Follow **PEP 8** for style conventions
- Use **Ruff** as the linter and formatter (`ruff check` and `ruff format`)
- Use **mypy** for static type checking (`mypy .`)
- Maximum line length: **120 characters**
- Use **type hints** on all function signatures and class attributes
- Use `from __future__ import annotations` at the top of every module for modern annotation syntax

### Naming Conventions

| Element         | Convention         | Example                    |
|-----------------|--------------------|----------------------------|
| Modules         | `snake_case`       | `heart_rate_analyzer.py`   |
| Classes         | `PascalCase`       | `HeartRateAnalyzer`        |
| Functions       | `snake_case`       | `calculate_bmi()`          |
| Constants       | `UPPER_SNAKE_CASE` | `MAX_HEART_RATE`           |
| Private members | `_leading_underscore` | `_internal_state`       |

## Project Structure

Follow this standard layout:

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

## Dependencies & Imports

- Define all dependencies in `pyproject.toml`
- Use **absolute imports** within the package: `from healthy_ai_engine.models import User`
- Group imports in this order (separated by blank lines):
  1. Standard library
  2. Third-party packages
  3. Local/project imports

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

## Docstrings

- Use **Google-style docstrings** on all public classes, methods, and functions
- Example:

```python
def calculate_vo2_max(heart_rate: float, age: int) -> float:
    """Estimate VO2 max from heart rate and age.

    Uses the standard formula to provide an approximation of maximal
    oxygen uptake.

    Args:
        heart_rate: Resting heart rate in bpm.
        age: Age in years.

    Returns:
        Estimated VO2 max in mL/kg/min.

    Raises:
        ValueError: If heart_rate or age is out of physiological range.
    """
```

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

## Pre-Commit Checklist

Before committing Python code, verify:

1. `ruff check .` — no linting errors
2. `ruff format --check .` — code is formatted
3. `mypy .` — no type errors
4. `pytest tests/ -v` — all tests pass
5. Type hints are present on all public APIs
6. Docstrings are present on all public classes and functions
