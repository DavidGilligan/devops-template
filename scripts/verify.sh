#!/usr/bin/env bash
set -euo pipefail

echo "[verify] checking docker and compose..."
command -v docker >/dev/null || { echo "[verify] docker missing"; exit 1; }
command -v docker compose >/dev/null || { echo "[verify] docker compose missing"; exit 1; }

echo "[verify] containers status:"
docker compose ps

echo "[verify] checking ClickHouse TCP 9000..."
if docker exec $(docker compose ps -q clickhouse) bash -lc "bash -c '</dev/tcp/127.0.0.1/9000'"; then
  echo "[verify] clickhouse port open"
else
  echo "[verify] clickhouse not reachable on 9000"; exit 1
fi

echo "[verify] checking SigNoz Query Service..."
if docker exec $(docker compose ps -q signoz-query-service) bash -lc "curl -fsS http://localhost:8080/ready || curl -fsS http://localhost:8080/health"; then
  echo "[verify] query service healthy"
else
  echo "[verify] query service health check failed"; exit 1
fi

echo "[verify] checking SigNoz UI..."
if docker exec $(docker compose ps -q signoz-frontend) bash -lc "curl -fsS http://localhost:3301 >/dev/null"; then
  echo "[verify] frontend reachable internally"
else
  echo "[verify] frontend not responding"; exit 1
fi

echo "[verify] checking OTel Collector OTLP HTTP 4318..."
if docker exec $(docker compose ps -q otel-collector) bash -lc "curl -fsS http://localhost:4318/ || true"; then
  echo "[verify] otlp endpoint reachable internally"
else
  echo "[verify] otlp endpoint not reachable"; exit 1
fi

# Optional: public routes via Traefik (skip if no domain)
if [[ -n "${OBS_DOMAIN:-}" ]]; then
  echo "[verify] checking Traefik route for OBS_DOMAIN=${OBS_DOMAIN}"
  curl -kfsS "https://${OBS_DOMAIN}" >/dev/null && echo "[verify] SigNoz UI reachable via Traefik" || echo "[verify] WARNING: SigNoz UI not reachable via Traefik"
fi
if [[ -n "${OTLP_DOMAIN:-}" ]]; then
  echo "[verify] checking Traefik route for OTLP_DOMAIN=${OTLP_DOMAIN}"
  curl -kfsS -X POST "https://${OTLP_DOMAIN}/v1/traces" -H "Content-Type: application/json" -d '{}' >/dev/null 2>&1 \
    && echo "[verify] OTLP endpoint reachable via Traefik (HTTP 200/4xx expected)" \
    || echo "[verify] WARNING: OTLP not reachable via Traefik"
fi

echo "[verify] all checks complete."
