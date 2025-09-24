#!/usr/bin/env bash
set -euo pipefail

# Restores a ClickHouse backup from S3-compatible storage.
# Usage: scripts/restore.sh ch-backup-YYYYmmdd-HHMMSS
# Requires env: S3_BUCKET, S3_ENDPOINT and rclone configured with a remote named 's3'.

BK_NAME="${1:-}"
if [ -z "$BK_NAME" ]; then
  echo "Usage: $0 ch-backup-YYYYmmdd-HHMMSS"; exit 1
fi

CH_CONT=$(docker compose ps -q clickhouse)
if [ -z "${CH_CONT}" ]; then
  echo "[restore] clickhouse container not found"; exit 1
fi

echo "[restore] fetching backup ${BK_NAME} from object storage..."
# Put backup under a temp dir on the host
HOST_TMP="$(pwd)/.tmp-restore/${BK_NAME}"
mkdir -p "${HOST_TMP}"
rclone copy "s3:${S3_BUCKET}/clickhouse/${BK_NAME}" "${HOST_TMP}" --s3-endpoint "${S3_ENDPOINT}"

echo "[restore] stopping services that depend on ClickHouse..."
docker compose stop signoz-query-service signoz-frontend otel-collector || true

echo "[restore] restoring into ClickHouse volume..."
# Identify the Docker volume path for clickhouse_data
VOL_NAME=$(docker volume ls -q | grep clickhouse_data || true)
if [ -z "$VOL_NAME" ]; then
  echo "[restore] clickhouse_data volume not found"; exit 1
fi
VOL_PATH="/var/lib/docker/volumes/${VOL_NAME}/_data"

# Move current data aside and unpack
sudo mv "${VOL_PATH}/data" "${VOL_PATH}/data.prev.$(date +%s)" || true
sudo mkdir -p "${VOL_PATH}/data"
sudo tar -xzf "${HOST_TMP}/data.tgz" -C "${VOL_PATH}"

echo "[restore] starting ClickHouse and dependants..."
docker compose up -d clickhouse
sleep 5
docker compose up -d signoz-query-service signoz-frontend otel-collector

echo "[restore] cleaning up temp files..."
rm -rf "$(pwd)/.tmp-restore/${BK_NAME}" || true

echo "[restore] restore completed. Validate data in SigNoz."
