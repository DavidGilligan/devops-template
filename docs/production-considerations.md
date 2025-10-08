# Production Considerations

- Persistence: named volumes for ClickHouse, config mounts read-only.
- TLS and access: Traefik with HTTPS, basic auth, OTLP allow list.
- Backups and retention: nightly snapshot, ClickHouse TTLs.
- Alerts and SLOs: error rate and latency, routed to Slack or email.
- Updates: pin image versions, monthly refresh.
- Secrets and network: private Docker network, env files or secret store.

- On Linux and macOS, acme.json (Traefik’s certificate store) must be created empty and locked down with strict permissions:
   - touch config/traefik/acme.json
   - chmod 600 config/traefik/acme.json

- On Windows, you only need to create the file. The chmod step is not required - Docker Desktop will enforce the correct permissions inside the container automatically:

- ni config/traefik/acme.json -Force

- Make sure the file exists and is empty before starting Traefik. It will be populated automatically when TLS certificates are issued.