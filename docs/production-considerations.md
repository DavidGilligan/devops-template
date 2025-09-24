# Production Considerations

- Persistence: named volumes for ClickHouse, config mounts read-only.
- TLS and access: Traefik with HTTPS, basic auth, OTLP allow list.
- Backups and retention: nightly snapshot, ClickHouse TTLs.
- Alerts and SLOs: error rate and latency, routed to Slack or email.
- Updates: pin image versions, monthly refresh.
- Secrets and network: private Docker network, env files or secret store.
