# System Architecture

The final architecture provides a lightweight yet production capable pipeline:
- CI builds Docker images and pushes to a registry.
- Runtime uses Docker and Compose.
- Observability uses OpenTelemetry → Collector → ClickHouse → SigNoz.
- Traefik provides TLS, auth, and OTLP access control.
- Rollback path and hotfix after stable are modelled.

See `docs/diagrams/system-architecture.mmd` for the Mermaid source.
