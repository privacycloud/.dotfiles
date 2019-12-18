#!/usr/bin/env bash

echo
echo "Installing Homebrew..."
echo
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

echo
echo "Installing nvm..."
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

echo
echo "Installing Oh My Zsh..."
echo
curl -L http://install.ohmyz.sh | sh

echo 
echo "Installing gcloud..."
echo
curl https://sdk.cloud.google.com | bash

echo
echo "Installing dotfiles..."
echo
ln -nfsv $(pwd)/git/gitconfig $HOME/.gitconfig
ln -nfsv $(pwd)/git/gitignore_global $HOME/.gitignore_global
mkdir -p $HOME/.ssh && ln -nfsv $(pwd)/ssh/config $HOME/.ssh/config
