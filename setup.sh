#!/bin/sh

# A basic shell script to set up an environment
#   using my dotfiles

echo "Running script..."

cp bashrc ~/.bashrc
cp zshrc ~/.zshrc
cp -r emacs.d/ ~/.emacs.d
cp -r oh-my-zsh/custom/ ~/.oh-my-zsh/custom

echo "Done."

