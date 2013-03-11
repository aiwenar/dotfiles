#!/bin/bash
##
# aiwenár - dotfiles install script
#

cd $(dirname $0)

pwd=`pwd`
ln -s $pwd/profile $HOME/.profile
ln -s $pwd/scripts $HOME/.scripts
ln -s $pwd/startup.py $HOME/.startup.py
ln -s $pwd/zshrc $HOME/.zshrc

cd vimfiles
./install.sh
