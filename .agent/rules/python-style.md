---
description: Python code style, formatting, naming conventions, imports, and docstrings for the healthy-ai-engine project
globs: ["**/*.py"]
---

# Python Code Style

## Communication Guidelines

- **Always explain your reasoning** — when writing, changing, or suggesting code, explain *why* you made that choice (e.g., why a particular pattern, data structure, or library was used).
- **Teach when correcting** — if you correct or rewrite code the user wrote, clearly explain what was wrong and why the new approach is better. Treat corrections as learning opportunities.
- **Don't silently change things** — never refactor, rename, or restructure code without calling out what changed and the reasoning behind it.

## Formatting & Linting

- Follow **PEP 8** for style conventions
- Use **Ruff** as the linter and formatter (`ruff check` and `ruff format`)
- Use **mypy** for static type checking (`mypy .`)
- Maximum line length: **120 characters**
- Use **type hints** on all function signatures and class attributes
- Use `from __future__ import annotations` at the top of every module for modern annotation syntax

## Naming Conventions

| Element         | Convention            | Example                  |
|-----------------|-----------------------|--------------------------|
| Modules         | `snake_case`          | `heart_rate_analyzer.py` |
| Classes         | `PascalCase`          | `HeartRateAnalyzer`      |
| Functions       | `snake_case`          | `calculate_bmi()`        |
| Constants       | `UPPER_SNAKE_CASE`    | `MAX_HEART_RATE`         |
| Private members | `_leading_underscore` | `_internal_state`        |

## Imports

- Define all dependencies in `pyproject.toml`
- Use **absolute imports** within the package: `from healthy_ai_engine.models import User`
- Group imports in this order (separated by blank lines):
  1. Standard library
  2. Third-party packages
  3. Local/project imports

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
