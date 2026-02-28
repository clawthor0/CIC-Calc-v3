#!/usr/bin/env bash
set -euo pipefail
REPO="/home/siem/.openclaw/workspace/CIC-Calc-v3"
BRANCH="main"
WATCH_DIR="$REPO/dev"
cd "$REPO"

current=$(git rev-parse --abbrev-ref HEAD)
if [ "$current" != "$BRANCH" ]; then
  git checkout "$BRANCH" >/dev/null 2>&1 || true
fi

sig() {
  find "$WATCH_DIR" -type f -print0 2>/dev/null | sort -z | xargs -0 sha1sum 2>/dev/null | sha1sum | awk '{print $1}'
}

last="$(sig || echo none)"
while true; do
  sleep 5
  now="$(sig || echo none)"
  if [ "$now" != "$last" ]; then
    sleep 2
    git add dev
    if ! git diff --cached --quiet; then
      ts=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
      git commit -m "auto: sync dev folder ($ts)" >/dev/null || true
      git push origin "$BRANCH" >/dev/null || true
    fi
    last="$now"
  fi
done
