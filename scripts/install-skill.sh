#!/usr/bin/env bash
# Symlink a team skill from this repo into ~/.cursor/skills/ for use in every project.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$ROOT/.cursor/skills"
TARGET_ROOT="${HOME}/.cursor/skills"

usage() {
  echo "Usage: $0 <skill-name> [--copy]"
  echo "  default: symlink  .cursor/skills/<name> -> ~/.cursor/skills/<name>"
  echo "  --copy:  copy instead of symlink"
  echo
  echo "Available skills:"
  find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d ! -name '.*' -exec basename {} \; 2>/dev/null | sort || true
  exit 1
}

[[ $# -ge 1 ]] || usage
NAME="$1"
MODE="${2:-}"

SRC="$SKILLS_DIR/$NAME"
DEST="$TARGET_ROOT/$NAME"

if [[ ! -f "$SRC/SKILL.md" ]]; then
  echo "error: missing skill at $SRC/SKILL.md" >&2
  usage
fi

mkdir -p "$TARGET_ROOT"

if [[ -e "$DEST" || -L "$DEST" ]]; then
  echo "error: already exists: $DEST" >&2
  echo "Remove it first if you want to reinstall." >&2
  exit 1
fi

if [[ "$MODE" == "--copy" ]]; then
  cp -R "$SRC" "$DEST"
  echo "Copied $NAME -> $DEST"
else
  ln -s "$SRC" "$DEST"
  echo "Linked $NAME -> $DEST"
fi
