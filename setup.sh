#!/bin/sh

# A basic shell script to set up an environment

echo "Running script..."
SCRIPT_HOME=$(dirname $0)

echo "Installing Homebrew..."
if [[ $(command -v brew) == "" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying bash, zsh, emacs, dircolors..."
cp $SCRIPT_HOME/bashrc ~/.bashrc
cp $SCRIPT_HOME/zshrc ~/.zshrc
cp -r $SCRIPT_HOME/oh-my-zsh/custom/ ~/.oh-my-zsh/custom
cp -r $SCRIPT_HOME/emacs.d/ ~/.emacs.d
cp $SCRIPT_HOME/dircolors ~/.dircolors

echo "Setup Solarized emacs..."
# Optionally customize to dark theme
git clone https://github.com/sellout/emacs-color-theme-solarized.git
mv emacs-color-theme-solarized/* $SCRIPT_HOME/emacs.d/themes/
rm -r emacs-color-theme-solarized

echo "Setup Solarized dircolors"
if [[ $(command -v gdircolors) == "" ]]; then
    brew install coreutils
fi
gdircolors

echo "Setup Solarized terminal"
echo "See https://github.com/tomislav/osx-terminal.app-colors-solarized"

echo "Done."

