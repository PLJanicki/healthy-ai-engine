---
description: Run all pre-commit checks (linting, formatting, type checking, tests) before committing Python code
---

# Pre-Commit Checks

Run the following checks sequentially. Stop and report if any step fails.

// turbo-all

1. Run Ruff linter:
```bash
ruff check .
```

2. Check Ruff formatting:
```bash
ruff format --check .
```

3. Run mypy type checking:
```bash
mypy .
```

4. Run the test suite:
```bash
pytest tests/ -v
```

5. Report the results of all checks to the user. If any step failed, summarize what needs to be fixed.
