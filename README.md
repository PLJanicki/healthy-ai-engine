# 🏃 healthy-ai-engine

> An open-source AI engine for fitness tracking and health intelligence — built to explore and test **Continuous AI** workflows.

[![Python 3.12+](https://img.shields.io/badge/python-3.12+-blue.svg)](https://www.python.org/downloads/)
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![mypy](https://img.shields.io/badge/type--checked-mypy-blue.svg)](https://mypy-lang.org/)

## What is this?

**healthy-ai-engine** is a real-world Python project used as a testbed for **Continuous AI** — the practice of integrating AI-powered agents, tools, and workflows into every stage of software development.

The domain (fitness tracking & health intelligence) provides a rich, realistic context for building and validating AI-driven development pipelines — from code generation and review to testing and deployment.

### Key Focus Areas

- 🤖 **Continuous AI** — experimenting with AI agents throughout the development lifecycle
- 🏋️ **Health & Fitness Domain** — real-time physiological data processing and insights
- 🧪 **Quality-First** — strict typing, linting, and testing as first-class citizens
- 🔧 **Modern Python** — Python 3.12+, Pydantic v2, async-first architecture

## Tech Stack

| Tool | Purpose |
|------|---------|
| **Python 3.12+** | Language |
| **uv** | Package management |
| **Pydantic v2** | Data models & validation |
| **httpx** | Async HTTP client |
| **Ruff** | Linting & formatting |
| **mypy** | Static type checking |
| **pytest** | Testing framework |

## Getting Started

### Prerequisites

- Python 3.12+
- [uv](https://docs.astral.sh/uv/) package manager

### Setup

```bash
# Clone the repository
git clone https://github.com/PLJanicki/healthy-ai-engine.git
cd healthy-ai-engine

# Install dependencies (creates .venv automatically)
uv sync --all-extras

# Run the quality checks
ruff check .
ruff format --check .
mypy .
pytest tests/ -v
```

## Project Structure

```
healthy-ai-engine/
├── src/
│   └── healthy_ai_engine/    # Main package
│       ├── agents/           # AI agents
│       ├── models/           # Data models (Pydantic)
│       ├── services/         # Business logic
│       ├── utils/            # Shared utilities
│       └── config/           # Configuration
├── tests/
│   ├── unit/
│   └── integration/
├── .agent/                   # Antigravity agent skills, rules & workflows
├── pyproject.toml
└── README.md
```

## Contributing

Contributions are welcome! Please:

1. **Fork** the repository
2. Create a feature branch (`git checkout -b feat/your-feature`)
3. Follow the code style enforced by Ruff and mypy
4. Submit a **Pull Request** — all PRs require review from a code owner

## License

This project is licensed under the [GNU Affero General Public License v3.0](LICENSE).
