#!/usr/bin/env bash
set -euo pipefail

echo "[setup] starting bootstrap..."

# Check deps
command -v docker >/dev/null 2>&1 || { echo >&2 "[setup] docker not found"; exit 1; }
command -v docker compose >/dev/null 2>&1 || { echo >&2 "[setup] docker compose not found"; exit 1; }

# Env file
if [ ! -f ".env" ]; then
  if [ -f ".env.example" ]; then
    echo "[setup] .env not found, copying from .env.example"
    cp .env.example .env
  else
    echo "[setup] .env and .env.example not found. Please create .env"; exit 1
  fi
fi

# Traefik cert store
if [ ! -f "config/traefik/acme.json" ]; then
  echo "[setup] creating config/traefik/acme.json"
  mkdir -p config/traefik
  : > config/traefik/acme.json
fi

# Create shared network if missing
if ! docker network ls --format '{{.Name}}' | grep -q '^devops-template_observability_net$'; then
  echo "[setup] creating docker network observability_net"
  docker network create devops-template_observability_net >/dev/null 2>&1 || true
fi

echo "[setup] pulling images..."
docker compose pull || true

echo "[setup] bringing stack up..."
docker compose up -d

echo "[setup] stack running."
echo " - SigNoz UI: https://${OBS_DOMAIN:-localhost}  (or http://localhost:3301 if Traefik not on a public domain)"
echo " - OTLP endpoint: https://${OTLP_DOMAIN:-localhost}  (Traefik routes to otel-collector:4318)"
