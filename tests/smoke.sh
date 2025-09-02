#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8081}"

echo "🔎 Test 1: HTTP 200 sur $URL"
status=$(curl -s -o /tmp/page.html -w "%{http_code}" "$URL")
if [ "$status" != "200" ]; then
  echo "❌ Status attendu 200, obtenu $status"
  exit 1
fi
echo "✅ HTTP 200 OK"

echo "🔎 Test 2: Le titre contient 'Demo Site'"
if grep -q "<title>Demo Site</title>" /tmp/page.html; then
  echo "✅ Titre OK"
else
  echo "❌ Titre non trouvé"
  exit 1
fi

echo "🎉 Tous les tests sont PASS"
