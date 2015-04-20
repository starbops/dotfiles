#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

function load_pyenv() {
    PYENV_ROOT=$1   #"$HOME/.pyenv"
    export PYENV_ROOT
    PATH="$PYENV_ROOT/bin:$PATH"
    export PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

PATH="$PATH:/usr/local/sbin"
export PATH

CLICOLOR=1
LSCOLORS="gxfxcxdxbxegedabagacad"
export CLICOLOR
export LSCOLORS

HOMEBREW_GITHUB_API_TOKEN="3aaf86247eb170f93588d6f73118a35d75c771f1"
export HOMEBREW_GITHUB_API_TOKEN

if [ -d "$HOME/.rvm" ]; then
    PATH="$PATH:$HOME/.rvm/bin"
    export PATH
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


case $(uname -s) in
    "Darwin")
        if [ -d "/usr/local/opt/pyenv" ]; then
            load_pyenv "/usr/local/opt/pyenv"
        fi
        ;;
    "FreeBSD")
        ;;
    "Linux")
        if [ -d "$HOME/.pyenv" ]; then
            load_pyenv "$HOME/.pyenv"
        fi
        ;;
    *)
        ;;
esac

