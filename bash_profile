#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ $(uname -o) = "GNU/Linux" ]; then

    if [ -d ~/.pyenv ]; then
        PYENV_ROOT="$HOME/.pyenv"
        export PYENV_ROOT

        PATH="$PYENV_ROOT/bin:$PATH"
        export PATH

        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi

fi

