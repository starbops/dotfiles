#!/usr/bin/env sh

RCFILES=`ls | grep -v install.sh | grep -v README.md`
BASE16_GIT='https://github.com/chriskempson/base16-shell.git'
SALT_VIM='https://github.com/saltstack/salt-vim.git'

if [ -d "${HOME}/.config/base16-shell" ]; then
    echo "${HOME}/.config/base16-shell exists, skipped."
else
    git clone ${BASE16_GIT} ${HOME}/.config/base16-shell
fi

if [ -d "${HOME}/salt-vim" ]; then
    echo "${HOME}/salt-vim exists, skipped."
else
    git clone ${SALT_VIM}
fi
cp -r ${HOME}/salt-vim/ftdetect \
      ${HOME}/salt-vim/ftplugin \
      ${HOME}/salt-vim/syntax \
      ${HOME}/dotfiles/vim/
rm -rf ${HOME}/salt-vim

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

