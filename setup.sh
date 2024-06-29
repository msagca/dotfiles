#!/usr/bin/env bash
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do
	SOURCE_DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
	SOURCE=$(readlink "$SOURCE")
	[[ $SOURCE != /* ]] && SOURCE=$SOURCE_DIR/$SOURCE
done
SOURCE_DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
CONFIG_DIR="$HOME"/.config
mkdir -p "$CONFIG_DIR"
ln -sv "$SOURCE_DIR"/nvim "$CONFIG_DIR"
