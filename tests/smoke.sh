#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8081}"

# Test HTTP 200
status=$(curl -s -o /tmp/page.html -w "%{http_code}" "$URL")
if [ "$status" != "200" ]; then
  echo "❌ Status attendu 200, obtenu $status"
  exit 1
fi

# Test du titre
grep -q "<title>Demo Site</title>" /tmp/page.html || { echo "❌ Titre non trouvé"; exit 1; }

# Test contenu h1
grep -q '<h1 id="main-title">🚀 Démo de site statique</h1>' /tmp/page.html || { echo "❌ H1 manquant"; exit 1; }

# Test présence d'éléments de la liste
for item in Fast Lightweight Dockerized; do
  grep -q "$item" /tmp/page.html || { echo "❌ Liste features incorrecte : $item manquant"; exit 1; }
done

echo "🎉 Tous les tests avancés sont PASS"
