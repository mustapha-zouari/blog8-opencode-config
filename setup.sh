#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}"
mkdir -p "$target"

link() {
    local src="$repo/$1"
    local dst="$target/$1"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "already linked: $1"
        return
    fi

    if [ -L "$dst" ]; then
        rm "$dst"
        echo "replaced stale link: $1"
    elif [ -e "$dst" ]; then
        mv "$dst" "$dst.bak"
        echo "backed up: $1 -> $1.bak"
    fi

    ln -s "$src" "$dst"
    echo "linked: $1"
}

for item in opencode.jsonc AGENTS.md agents skills; do
    link "$item"
done

echo "done: $target"
