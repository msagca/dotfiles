#!/usr/bin/env bash
USER_CONFIG="$HOME"/.config
DOT_PATH="${BASH_SOURCE}"
while [ -L "$DOT_PATH" ]; do
	DOT_DIR=$(cd -P "$(dirname "$DOT_PATH")" >/dev/null 2>&1 && pwd)
	DOT_PATH=$(readlink "$DOT_PATH")
	[[ "$DOT_PATH" != /* ]] && DOT_PATH="$DOT_DIR/$DOT_PATH"
done
DOT_DIR=$(cd -P "$(dirname "$DOT_PATH")" >/dev/null 2>&1 && pwd)
mkdir -p "$USER_CONFIG"
ln -sv "$DOT_DIR"/nvim "$USER_CONFIG"
