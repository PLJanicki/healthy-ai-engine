.PHONY: dev install compile setup clean lint format typecheck test check precommit help

# Default target
all: setup compile

# --------------------------------------------------------------------------- #
# Development Environment
# --------------------------------------------------------------------------- #

# Full dev setup: install uv (if missing), sync all deps into .venv
dev:
	@echo "Setting up development environment..."
	@command -v uv >/dev/null 2>&1 || { echo "Installing uv..."; curl -LsSf https://astral.sh/uv/install.sh | sh; }
	uv sync --all-extras
	uv run pre-commit install
	@echo ""
	@echo "✅ Dev environment ready! Pre-commit hooks installed."

# --------------------------------------------------------------------------- #
# Code Quality
# --------------------------------------------------------------------------- #

# Run Ruff linter
lint:
	uv run ruff check .

# Run Ruff formatter check
format:
	uv run ruff format --check .

# Run mypy type checker
typecheck:
	uv run mypy .

# Run tests
test:
	uv run pytest tests/ -v

# Run all quality checks (same as pre-commit workflow)
check: lint format typecheck test
	@echo "✅ All checks passed!"

# Auto-fix lint and formatting issues
fix:
	uv run ruff check --fix .
	uv run ruff format .

# Run pre-commit hooks on all files
precommit:
	uv run pre-commit run --all-files

# --------------------------------------------------------------------------- #
# GitHub Actions Workflows (gh-aw)
# --------------------------------------------------------------------------- #

# Install the github/gh-aw extension
install:
	@echo "Installing github/gh-aw extension..."
	gh extension install github/gh-aw
	gh extension upgrade github/gh-aw

# Run gh aw compile
compile:
	@echo "Running gh aw compile..."
	gh aw compile
	gh aw compile --dir workflows

# Setup: install extension and compile
setup: install compile
	@echo "Setup complete!"

# Clean up (uninstall extension if needed)
clean:
	@echo "Uninstalling github/gh-aw extension..."
	gh extension remove github/gh-aw || true

# --------------------------------------------------------------------------- #
# Help
# --------------------------------------------------------------------------- #

help:
	@echo "Available targets:"
	@echo ""
	@echo "  Development:"
	@echo "    dev        - Set up dev environment (install uv, sync deps)"
	@echo "    fix        - Auto-fix lint and formatting issues"
	@echo ""
	@echo "  Quality Checks:"
	@echo "    lint       - Run Ruff linter"
	@echo "    format     - Check Ruff formatting"
	@echo "    typecheck  - Run mypy type checker"
	@echo "    test       - Run pytest test suite"
	@echo "    check      - Run all checks (lint + format + typecheck + test)"
	@echo ""
	@echo "  GitHub Actions:"
	@echo "    install    - Install the github/gh-aw extension"
	@echo "    compile    - Run gh aw compile"
	@echo "    setup      - Install extension and compile (default)"
	@echo "    clean      - Uninstall the extension"
