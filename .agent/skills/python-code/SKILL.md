---
name: python-code
description: Guidelines and conventions for writing, reviewing, and maintaining Python code in the healthy-ai-engine project
---

# Python Code Skill

Use this skill whenever writing, reviewing, refactoring, or debugging Python code in this project.

## When to Use

The agent should activate this skill when:

- Writing new Python modules, classes, or functions
- Reviewing or refactoring existing Python code
- Debugging Python errors or test failures
- Setting up project infrastructure (pyproject.toml, tooling config)

## How to Use

1. **Follow the rules** — the project has always-on rules in `.agent/rules/` that govern code style (`python-style.md`) and project conventions (`python-project.md`). These are automatically active, but reference them when making decisions.

2. **Write production-quality code** — this is a health/fitness AI engine. Code must be well-typed, well-tested, and well-documented. No shortcuts.

3. **Use the pre-commit workflow** — before committing, run `/pre-commit` or manually verify:
   - `ruff check .` — no linting errors
   - `ruff format --check .` — code is formatted
   - `mypy .` — no type errors
   - `pytest tests/ -v` — all tests pass

4. **Explain your work** — always explain *why* you made a choice. If correcting the user's code, explain what was wrong and why the new approach is better.

## Key Decisions Reference

- **Data models**: Pydantic v2 `BaseModel`
- **HTTP client**: `httpx` (async)
- **Testing**: `pytest` with fixtures
- **Type checking**: `mypy` strict mode
- **Linting/formatting**: Ruff
- **Config management**: `pydantic-settings` + environment variables
- **Package manager**: `uv`
