#!/bin/bash

D=$(dirname -- "${BASH_SOURCE[0]}")

ln -sf git/dotfiles/signature ~/.signature
ln -sf git/dotfiles/bashrc ~/.bashrc
ln -sf git/dotfiles/mbsyncrc ~/.mbsyncrc
ln -sf git/dotfiles/gitconfig ~/.gitconfig
