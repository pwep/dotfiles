#!/bin/bash

params="-sfbv"

while getopts "vib" args; do
    case $args in
        v)
            params="$params -v"
            ;;
        i)
            params="$params -i"
            ;;
        b)
            params="$params -b"
            ;;
    esac
done

# Store where the script was called from so we can reference it later
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Add monokai colors for vim if not present
if [ ! -f $HOME/.vim/colors/monokai.vim ]; then
  curl -fLo $HOME/.vim/colors/monokai.vim --create-dirs \
  https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
fi

# Symlink all of our dotfiles to the home directory
for i in .vimrc .bashrc .bash_profile;
do
  ln $params $script_home/$i $HOME/$i
done
