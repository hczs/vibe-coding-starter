#!/usr/bin/env bash
set -euo pipefail

P=$(pwd)
SKILLS_DIR="$P/.agents/skills"

echo "[1/8] Project metrics..."
echo "=== PROJECT ==="
echo "project_root: $P"
echo "files: $(find "$P" -type f ! -path '*/.git/*' ! -path '*/node_modules/*' ! -path '*/dist/*' ! -path '*/build/*' ! -path '*/.next/*' ! -path '*/__pycache__/*' 2>/dev/null | wc -l | tr -d ' ')"
echo "skills: $(find "$SKILLS_DIR" -name 'SKILL.md' 2>/dev/null | wc -l | tr -d ' ')"
echo

echo "[2/8] AGENTS.md..."
echo "=== AGENTS.md ==="
cat "$P/AGENTS.md" 2>/dev/null || echo "(none)"
echo

echo "[3/8] Nested AGENTS.md..."
echo "=== NESTED AGENTS.md ==="
find "$P" -mindepth 2 -name "AGENTS.md" ! -path '*/.git/*' ! -path '*/node_modules/*' 2>/dev/null || echo "(none)"
echo

echo "[4/8] Skill inventory..."
echo "=== SKILL INVENTORY ==="
find "$SKILLS_DIR" -name "SKILL.md" -print 2>/dev/null | sort
echo

echo "=== SKILL FRONTMATTER ==="
find "$SKILLS_DIR" -name "SKILL.md" -print 2>/dev/null | sort | while IFS= read -r f; do
  echo "--- $f ---"
  sed -n '1,8p' "$f"
done
echo

echo "=== SKILL FULL CONTENT ==="
sed -n '1,240p' "$SKILLS_DIR/health/SKILL.md" 2>/dev/null || echo "(unavailable)"
echo

echo "[5/8] Verification hints..."
echo "=== VERIFICATION HINTS ==="
[ -f "$P/package.json" ] && { echo "--- package.json ---"; sed -n '1,200p' "$P/package.json"; }
[ -f "$P/Makefile" ] && { echo "--- Makefile ---"; sed -n '1,120p' "$P/Makefile"; }
[ -f "$P/Cargo.toml" ] && { echo "--- Cargo.toml ---"; sed -n '1,160p' "$P/Cargo.toml"; }
[ -f "$P/pyproject.toml" ] && { echo "--- pyproject.toml ---"; sed -n '1,200p' "$P/pyproject.toml"; }
[ -f "$P/pytest.ini" ] && { echo "--- pytest.ini ---"; sed -n '1,120p' "$P/pytest.ini"; }
echo

echo "[6/8] CI files..."
echo "=== CI FILES ==="
find "$P/.github/workflows" -type f 2>/dev/null | sort | while IFS= read -r f; do
  echo "--- $f ---"
  sed -n '1,160p' "$f"
done
echo

echo "[7/8] Codex files..."
echo "=== CODEX FILES ==="
find "$P" -maxdepth 3 \( -path "$P/.agents/*" -o -name ".codex" -o -name "AGENTS.md" \) 2>/dev/null | sort
echo

echo "[8/8] Skill security scan..."
echo "=== SKILL SECURITY CONTENT ==="
find "$SKILLS_DIR" -name "SKILL.md" -print 2>/dev/null | sort | while IFS= read -r f; do
  echo "--- $f ---"
  if rg -n "rm -rf|git reset --hard|curl .*\\| bash|sudo " "$f"; then
    :
  else
    status=$?
    if [ "$status" -ne 1 ]; then
      exit "$status"
    fi
  fi
done
