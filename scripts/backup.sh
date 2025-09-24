#!/usr/bin/env bash
set -euo pipefail

# Backs up ClickHouse data to S3-compatible object storage.
# Requires env: S3_BUCKET, S3_ENDPOINT, S3_ACCESS_KEY_ID, S3_SECRET_ACCESS_KEY

CH_CONT=$(docker compose ps -q clickhouse)
STAMP=$(date +%Y%m%d-%H%M%S)
BK_NAME="ch-backup-${STAMP}"

if [ -z "${CH_CONT}" ]; then
  echo "[backup] clickhouse container not found"; exit 1
fi

echo "[backup] creating ClickHouse backup ${BK_NAME}..."
docker exec -i "${CH_CONT}" bash -lc "
  apt-get update >/dev/null 2>&1 || true
  apt-get install -y curl ca-certificates >/dev/null 2>&1 || true
  mkdir -p /var/lib/clickhouse/backup/${BK_NAME}
  # Simple filesystem copy of data parts. For production use, consider clickhouse-backup.
  tar -C /var/lib/clickhouse --exclude='tmp' -czf /var/lib/clickhouse/backup/${BK_NAME}/data.tgz data
"

echo "[backup] uploading to object storage..."
# Use rclone if present, else curl to S3-compatible endpoint
if command -v rclone >/dev/null 2>&1; then
  # Expect remote named 's3' configured via rclone config
  rclone copy "/var/lib/docker/volumes/$(docker volume ls -q | grep clickhouse_data)/_data/backup/${BK_NAME}" "s3:${S3_BUCKET}/clickhouse/${BK_NAME}" --s3-endpoint "${S3_ENDPOINT}"
else
  # Pre-signed upload via AWS S3 API compatible endpoints using curl
  # Requires aws cli for signing, otherwise suggest using rclone
  echo "[backup] rclone not installed. Please configure rclone or use clickhouse-backup for robust backups."
  exit 2
fi

echo "[backup] done: ${BK_NAME}"
