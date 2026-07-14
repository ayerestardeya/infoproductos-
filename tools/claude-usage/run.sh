#!/usr/bin/env bash
# Wrapper to force claude-usage to keep its database inside this project,
# never at the default ~/.claude/usage.db (global, breaks project isolation).
set -e
cd "$(dirname "$0")"
export CLAUDE_USAGE_DB="$(pwd)/usage.db"
python cli.py "$@"
