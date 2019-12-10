#!/usr/bin/env bash

echo
echo "Installing Homebrew..."
echo
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

echo
echo "Installing nvm..."
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

echo
echo "Installing Zsh..."
echo
sudo bash -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo
echo "Installing Oh My Zsh..."
echo
curl -L http://install.ohmyz.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
mkdir -p $HOME/.oh-my-zsh/custom/plugins/nvm-auto-use && curl https://raw.githubusercontent.com/tomsquest/nvm-auto-use.zsh/master/nvm-auto-use.zsh -o $HOME/.oh-my-zsh/custom/plugins/nvm-auto-use/nvm-auto-use.plugin.zsh

echo
echo "Installing dotfiles..."
echo
ln -nfsv $(pwd)/git/gitconfig $HOME/.gitconfig
ln -nfsv $(pwd)/git/gitignore_global $HOME/.gitignore_global
mkdir -p $HOME/.ssh && ln -nfsv $(pwd)/ssh/config $HOME/.ssh/config
