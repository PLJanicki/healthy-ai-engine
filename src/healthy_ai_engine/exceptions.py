"""Custom exceptions for healthy-ai-engine."""

from __future__ import annotations


class HealthyAIError(Exception):
    """Base exception for all healthy-ai-engine errors."""


class ConfigurationError(HealthyAIError):
    """Raised when there is a configuration problem."""


class ValidationError(HealthyAIError):
    """Raised when data validation fails outside of Pydantic."""
