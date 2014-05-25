#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function get_exit_code {
    case "$?" in
        0) echo -e "\033[1;34m$?\033[0m" ;;
        *) echo -e "\033[1;31m$?\033[0m" ;;
    esac
}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))\xE2\x94\x80/"
}

function untar() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  echo "tar jxvf $1"; tar jxvf $1 ;;
            *.tar.gz)   echo "tar zxvf $1"; tar zxvf $1 ;;
            *.tar)      echo "tar xvf $1";  tar xvf $1  ;;
            *.tbz2)     echo "tar xvif $1"; tar xvjf $1 ;;
            *.tgz)      echo "tar xvzf $1"; tar xvzf $1 ;;
            *.txz)      echo "tar xvJf $1"; tar xvJf $1 ;;
            *.bz2)      echo "bunzip2 $1";  bunzip2  $1 ;;
            *.rar)      echo "unrar x $1";    unrar x $1    ;;
            *.gz)       echo "gunzip $1";   gunzip $1   ;;
            *.zip)      echo "unzip $1";    unzip $1    ;;
            *.7z)       echo "7z x $1";     7z x $1     ;;
            *)          echo "don't know how to extract '$1' Q_Q" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# BIND KEYS
bind 'C-p:history-search-backward'
bind 'C-n:history-search-forward'

# ALIAS
alias ls='ls --color=auto'
alias la='ls -Fa'
alias ll='ls -AFhl'
alias rm='rm -i'
alias vim='vim -p'

# EXPORT
#PS1='[\u@\h \W]\$ '
#export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\$?\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -sh | head -n1 | sed 's/total //')b\[\033[1;37m\])\342\224\200\$(parse_git_branch)> \[\033[0m\]"
export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(get_exit_code)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -sh | head -n1 | sed 's/total //')b\[\033[1;37m\])\342\224\200\$(parse_git_branch)> \[\033[0m\]"
export TERM='xterm-256color'
export EDITOR='vim'
export PAGER='less'
export LESS='-fmrS'
export LESSCHARDEF='8bcccbcc18b95..'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
