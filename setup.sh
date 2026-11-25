#!/usr/bin/env bash
export MSYS=winsymlinks:nativestrict
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
ln -sv "$DOT_DIR"/oh-my-posh "$USER_CONFIG"
add_line() {
	mkdir -p "$(dirname "$2")"
	grep -qsxF -- "$1" "$2" || echo "$1" >>"$2"
}
add_line 'export VIRTUAL_ENV_DISABLE_PROMPT=1' "$HOME"/.bashrc
add_line 'command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init bash --config "$HOME/.config/oh-my-posh/msagca.omp.json")"' "$HOME"/.bashrc
if command -v pwsh >/dev/null; then
	PWSH_PROFILE=$(pwsh -NoProfile -Command '$PROFILE' | tr -d '\r')
	command -v cygpath >/dev/null && PWSH_PROFILE=$(cygpath -u "$PWSH_PROFILE")
	add_line '$env:VIRTUAL_ENV_DISABLE_PROMPT = 1' "$PWSH_PROFILE"
	add_line 'if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) { oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/msagca.omp.json" | Invoke-Expression }' "$PWSH_PROFILE"
fi
