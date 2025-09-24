#!/usr/bin/env bash
set -euo pipefail
IMG="${1:-}"
if [ -z "$IMG" ]; then
  echo "Usage: scripts/tag_previous.sh <image-ref>"; exit 1
fi
echo "$IMG" > .previous_image.txt
echo "[tag_previous] recorded $IMG"
