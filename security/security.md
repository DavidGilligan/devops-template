# Security

**Secret management**
- Never commit secrets to the repository.
- Use `.env` files (excluded via `.gitignore`) or a secret manager.

**Network and access**
- Traefik terminates TLS by default and supports optional basic authentication.
- Restrict OTLP ingestion (telemetry data) by IP range or authentication token.

**Vulnerability management**
- Keep dependencies up to date (e.g. Python requirements, Docker images).
- Review GitHub Dependabot alerts or equivalent.

**Reporting**
- Report vulnerabilities or security issues to the repository maintainers.
