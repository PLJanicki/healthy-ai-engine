"""Smoke test to verify the package is importable."""

from __future__ import annotations


def test_package_version() -> None:
    """Verify the package exposes a version string."""
    from healthy_ai_engine import __version__

    assert isinstance(__version__, str)
    assert __version__ == "0.1.0"
