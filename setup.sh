#!/usr/bin/bash
SOURCE="${BASH_SOURCE}"
while [ -L "$SOURCE" ]; do
	SOURCE_DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
	SOURCE=$(readlink "$SOURCE")
	[[ "$SOURCE" != /* ]] && SOURCE="$SOURCE_DIR/$SOURCE"
done
SOURCE_DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
TARGET_DIR="$HOME"/.config
mkdir -p "$TARGET_DIR"
ln -sv "$SOURCE_DIR"/nvim "$TARGET_DIR"
