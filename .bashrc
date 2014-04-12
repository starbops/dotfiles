function get_exit_code {
    case "$?" in
        0) echo -e "\033[1;34m$?\033[0m" ;;
        *) echo -e "\033[1;31m$?\033[0m" ;;
    esac
}

function totalsize {
    total=$(ls -al . | grep "^-" | awk '{ total += $5 } END { print total }')
    if [ -z $total ]; then
        total="0 B"
    elif [ $total -lt 1024 ]; then
        total="${total} B"
    elif [ $total -lt 1048576 ]; then
        total="$(echo -e "scale=3 \n$total/1024 \nquit" | bc) KB"
    elif [ $total -lt 1073741824 ]; then
        total="$(echo -e "scale=3 \n$total/1024/1024 \nquit" | bc) MB"
    elif [ $total -lt 1099511627776 ]; then
        total="$(echo -e "scale=3 \n$total/1024/1024/1024 \nquit" | bc) GB"
    fi
    echo $total
}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))─/"
}

# ALIAS
alias ls="ls -FG"
alias ll="ls -lhi"
alias la="ll -A"
alias grep="grep --colour=auto"

# EXPORT
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${PATH}:/Users/starbops/.rvm/bin:/Users/starbops/.cabal/bin"
export TERM="xterm-color"
#export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\A \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(totalsize)\[\033[1;37m\])\342\224\200> \[\033[0m\]"
export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(get_exit_code)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\A \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(totalsize)\[\033[1;37m\])\342\224\200\$(parse_git_branch)> \[\033[0m\]"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export HOMEBREW_GITHUB_API_TOKEN="d68c394a614b7ccafe17de4b8a9830815e81d94b"

# COLOURFUL MAN
export LESS_TERMCAP_mb=$'\E[01;31m'     # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'         # end mode
export LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'  # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'         # end underline
export LESS_TERMCAP_us=$'\E[01;32m'     # begin underline

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
