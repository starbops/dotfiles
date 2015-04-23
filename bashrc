#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

#########################################
# Color Codes:
# Black       0;30     Dark Gray     1;30
# Red         0;31     Light Red     1;31
# Green       0;32     Light Green   1;32
# Brown       0;33     Yellow        1;33
# Blue        0;34     Light Blue    1;34
# Purple      0;35     Light Purple  1;35
# Cyan        0;36     Light Cyan    1;36
# Light Gray  0;37     White         1;37
#########################################

function smiley() {
    ret_val=$?
    if [ "$ret_val" = "0" ]
    then
        echo ":)"
    else
        echo ":( ($ret_val)"
    fi
}

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar jxvf $1     ;;
            *.tar.gz)    tar zxvf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar jxvf $1     ;;
            *.tgz)       tar zxvf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Base16 Shell
if [ -x "$HOME/.config/base16-shell/base16-eighties.dark.sh" ]; then
    BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
fi

# ALIAS
if [ $(uname -s) = "Linux" ]; then
    alias ls="ls --color=auto"
    alias grep="grep --colour=auto"
fi

alias ls="ls -F"
alias ll="ls -lhi"
alias la="ll -A"
alias grep="grep --colour=auto"
alias vim="vim -p"

# BIND KEYS
bind "C-p:history-search-backward"
bind "C-n:history-search-forward"

PS1="\h \$(smiley) \e[34;1m\w\e[0m\n\u \$ "
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
TERM="xterm-256color"
EDITOR="vim"
PAGER="less"
LESS="-fmrS"
LESSCHARDEF="8bcccbcc18b95.."

