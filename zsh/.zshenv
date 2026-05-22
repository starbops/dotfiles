# Silent. Variables only. No PATH on macOS.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="-FRXM"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EZA_ICONS_AUTO=1

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
