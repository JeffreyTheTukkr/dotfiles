#!/usr/bin/env bash

dir=$(jq -r '.cwd // empty')
root=$(git -C "${dir:-$PWD}" rev-parse --show-toplevel 2>/dev/null) || exit 0

case "$root" in
    "$HOME"/code/*/*) ;;
    *) exit 0 ;;
esac

rel=${root#"$HOME"/code/}
org=${rel%%/*}
repo=${rel#*/}
repo=${repo%%/*}
doc="$HOME/.claude/project-docs/$org-$repo/CLAUDE.md"

[[ -f "$doc" ]] || exit 0
echo "Project docs from $doc:"
echo
cat "$doc"
