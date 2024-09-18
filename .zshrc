# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment variables
export PATH=$HOME/bin:$PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='/opt/homebrew/bin/vim'
export LESS="-F -R -X"
export DEFAULT_USER=$(whoami)
export GPG_TTY=$TTY

# Environment variables - Kubernetes
export do='--dry-run=client -o yaml'
export now='--force --grace-period=0'
export nk='-n kube-system'

# Environment variables - gnubin
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Environment variables - Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Environment variables - Golang
export GOPATH="$HOME/go"
export PATH="$(go env GOPATH)/bin:$PATH"

# Environment variables - Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"
#export JAVA_HOME="/opt/homebrew/Cellar/openjdk/16.0.2"

# Environment variables - NVM
export NVM_DIR="$HOME/.nvm"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Bash-like cursor moving and deletion
my-forward-word() {
    local WORDCHARS=${WORDCHARS//[\/.\-=]/}
    zle forward-word
}
zle -N my-forward-word
bindkey '^[f' my-forward-word

my-backward-word() {
    local WORDCHARS=${WORDCHARS//[\/.\-=]/}
    zle backward-word
}
zle -N my-backward-word
bindkey '^[b' my-backward-word

my-backward-kill-word() {
    local WORDCHARS=${WORDCHARS//[\/.\-=]/}
    zle backward-kill-word
}
zle -N my-backward-kill-word
bindkey '^[^?' my-backward-kill-word

ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(backward-kill-word my-backward-kill-word)

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#zstyle ':fzf-tab:*' popup-min-size 80 12
zstyle ':fzf-tab:complete:(cat|cd|cp|ls|mv|nvim|vim):*' fzf-preview \
    '[[ -d $realpath ]] && { echo "Directory: \e[1m$(basename "$realpath")\e[0m" && eza -1a --color=always --ignore-glob ".DS_Store|.idea|.vscode" $realpath } || bat --color=always --theme=Nord $realpath'
zstyle ':fzf-tab:complete:(cat|cd|cp|ls|mv|nvim|vim):*' fzf-flags \
    --border=double \
    --height=40% \
    --preview-window=right:65%:wrap:border-double \
    --bind='tab:toggle-down' \
    --bind='ctrl-\:change-preview-window(down,90%,wrap,cycle,border-double|hidden|right,50%,wrap,cycle,border-double)' \
    --bind='up:preview-up,down:preview-down,shift-up:preview-page-up,shift-down:preview-page-down,shift-left:preview-top,shift-right:preview-bottom'
zstyle ':fzf-tab:*' switch-group '<' '>'

# Aliases
alias ls='ls --color'
alias la='ls -ahl'
alias ll='ls -hl'
alias vim='nvim'
alias c='clear'
alias k='kubectl'
alias kaf='k apply -f'
alias kdf='k delete -f'
alias tmux='tmux -2'

# Shell integrations
FZF_CTRL_T_COMMAND= eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5

