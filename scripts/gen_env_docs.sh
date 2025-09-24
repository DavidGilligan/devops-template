#!/usr/bin/env bash
set -euo pipefail
echo "# Environment Variables" > docs/env.md
echo "" >> docs/env.md
awk -F= '/^[A-Z0-9_]+=/{print "- **" $1 "**"}' .env.example >> docs/env.md
echo "[gen_env_docs] wrote docs/env.md"
