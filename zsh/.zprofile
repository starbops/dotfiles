# =============================================================================
# .zprofile — login shells, after /etc/zprofile (path_helper).
# Owns PATH manipulation so Homebrew/OrbStack win over /usr/bin.
# =============================================================================

# --- Homebrew (Apple Silicon) ---
# Sets HOMEBREW_PREFIX/CELLAR/REPOSITORY and prepends bin/sbin to PATH.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"   # Intel Macs
fi

# --- Extra PATH entries layered on top of Homebrew defaults ---
typeset -U path PATH
path=(
  /opt/homebrew/opt/bison/bin
  /opt/homebrew/opt/curl/bin
  /opt/homebrew/opt/libxml2/bin
  /opt/homebrew/opt/coreutils/libexec/gnubin
  $HOME/.local/bin
  $GOPATH/bin
  $CARGO_HOME/bin
  $path
)
export PATH

# --- Keg-only library flags (for compilers and pkg-config) ---
# These are not symlinked by Homebrew to avoid conflicts with macOS system libs.
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"

# --- OrbStack (docker/k8s shims + DOCKER_HOST) ---
[[ -f ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh 2>/dev/null

# --- Per-machine overrides ---
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
