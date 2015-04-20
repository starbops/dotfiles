#!/usr/bin/env sh

RCFILES=`ls | grep -v install.sh | grep -v README.md`
BASE16_GIT='https://github.com/chriskempson/base16-shell.git'

git clone ${BASE16_GIT} ~/.config/base16-shell

for RCFILE in ${RCFILES}; do
    if [ -e ${HOME}/.${RCFILE} ]; then
        echo "Need backup!"
        if [ ! -d ${HOME}/dotbak ]; then
            mkdir ${HOME}/dotbak
            echo "Backup directory ${HOME}/dotbak constructed."
        fi
        mv ${HOME}/.${RCFILE} ${HOME}/dotbak/
        echo "The old .${RCFILE} is now resides under ${HOME}/dotbak/"
    fi
    ln -s ${PWD}/${RCFILE} ${HOME}/.${RCFILE}
done

echo "Symlinks are made under ${HOME}."
echo "Done."

