#!/bin/sh

# A basic shell script to set up an environment

echo "Running script..."
SCRIPT_HOME=$(dirname $0)

echo "Installing Homebrew..."
if [[ $(command -v brew) == "" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Done"

echo "Installing zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Done"

echo "Copying bash, zsh, dircolors..."
cp $SCRIPT_HOME/.bash_profile ~/.bash_profile
cp $SCRIPT_HOME/.bashrc ~/.bashrc
cp $SCRIPT_HOME/.zshrc ~/.zshrc
cp -r $SCRIPT_HOME/.oh-my-zsh/custom/ ~/.oh-my-zsh/custom
# cp -r $SCRIPT_HOME/.emacs.d/ ~/.emacs.d
cp $SCRIPT_HOME/.dircolors ~/.dircolors
cp $SCRIPT_HOME/.inputrc ~/.inputrc
echo "Done"

echo "Setup Solarized dircolors..."
if [[ $(command -v gdircolors) == "" ]]; then
    brew install coreutils
fi
gdircolors
echo "Done"

echo "Setup Solarized terminal..."
echo "WARNING: skipped, do it manually, see https://github.com/tomislav/osx-terminal.app-colors-solarized"
echo "Done"

echo "Setup custom MacOS keybindings..."
mkdir -p ~/Library/KeyBindings/
cp $SCRIPT_HOME/DefaultKeyBinding.dict ~/Library/KeyBindings/
echo "Done"

echo "Finished running script."
