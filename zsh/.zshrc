# =============================================================================
# Zinit bootstrap — https://github.com/zdharma-continuum/zinit
# =============================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# =============================================================================
# Plugins — loaded asynchronously after prompt (Turbo mode: `wait lucid`)
# =============================================================================
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# Cherry-picked OMZ snippets — no full OMZ install
zinit wait lucid for \
    OMZL::git.zsh \
    OMZL::directories.zsh \
    OMZL::history.zsh \
    OMZP::git \
    OMZP::sudo \
    OMZP::kubectl \
    OMZP::docker \
    OMZP::command-not-found

# fzf-tab — fuzzy tab completion
zinit wait lucid light-mode for Aloxaf/fzf-tab

# Tab/Shift-Tab to toggle multi-select inside fzf-tab (Ctrl-Space is taken
# by macOS input-method switcher). Enter still accepts.
zstyle ':fzf-tab:*' fzf-bindings 'tab:toggle+down' 'btab:toggle+up'

# =============================================================================
# Keybindings — force emacs mode + standard readline-style movement
# =============================================================================
bindkey -e                          # emacs keymap (overrides vi auto-detect from $EDITOR)

# -- Word-boundary widgets ----------------------------------------------------
# zsh word widgets consult $WORDCHARS to decide what's "in-word". The default
# (*?_-.[]~=/&;!#$%^(){}<>) makes whole paths act as one word. Scoped wrappers
# let different keys use different policies:
#   * Alt-* widgets : tight WORDCHARS → break on /, ., ~, =, - (path segments)
#   * Ctrl-W        : loose WORDCHARS → kill back to whitespace (whole arg)
_zle-segment() { local WORDCHARS='_'; zle "$1" }
backward-segment()         { _zle-segment backward-word }
forward-segment()          { _zle-segment forward-word }
backward-kill-segment()    { _zle-segment backward-kill-word }
kill-segment()             { _zle-segment kill-word }
backward-kill-whitespace() { local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'; zle backward-kill-word }
zle -N backward-segment
zle -N forward-segment
zle -N backward-kill-segment
zle -N kill-segment
zle -N backward-kill-whitespace

# Cursor movement
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^B' backward-char
bindkey '^F' forward-char
bindkey '^[b' backward-segment      # Alt+B — stops at /, ., ~, etc.
bindkey '^[f' forward-segment       # Alt+F — stops at /, ., ~, etc.

# Editing
bindkey '^K' kill-line
bindkey '^U' backward-kill-line
bindkey '^W' backward-kill-whitespace  # Ctrl-W — kill until whitespace
bindkey '^[^?' backward-kill-segment   # Alt-⌫  — kill one path segment
bindkey '^Y' .yank                     # bypass plugin wrappers (F-Sy-H, autosuggestions)
bindkey '^[y' .yank-pop                # so the YANK widget flag is preserved on LASTWIDGET
bindkey '^[d' kill-segment             # Alt+D — forward kill, segment-aware

# History
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Misc
bindkey '^[.' insert-last-word      # Alt+. — last arg of previous command
bindkey '^_' undo

# =============================================================================
# History
# =============================================================================
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS \
       SHARE_HISTORY APPEND_HISTORY EXTENDED_HISTORY HIST_VERIFY

# =============================================================================
# Tool integrations
# =============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
command -v zoxide >/dev/null && eval "$(zoxide init zsh --cmd cd)"

# =============================================================================
# Aliases + per-machine overrides
# =============================================================================
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local   # untracked, per-machine

# =============================================================================
# Tool managers
# =============================================================================
eval "$(mise activate zsh)"

# =============================================================================
# Starship — must be last
# =============================================================================
eval "$(starship init zsh)"
