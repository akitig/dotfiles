#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

backup_file() {
	local target

	target="$1"
	if [ -e "$target" ] || [ -L "$target" ]; then
		mv "$target" "$target.bak.$(date +%Y%m%d%H%M%S)"
	fi
}

link_file() {
	local src
	local dst

	src="$1"
	dst="$2"
	backup_file "$dst"
	ln -s "$src" "$dst"
	echo "linked: $dst -> $src"
}

main() {
	mkdir -p "$HOME/.vim/undo"

	link_file "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
	link_file "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
	link_file "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
	link_file "$SCRIPT_DIR/.zsh" "$HOME/.zsh"

	echo "done"
	echo "run: source ~/.zshrc"
}

main "$@"
