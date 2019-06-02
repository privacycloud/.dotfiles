.DEFAULT_GOAL: all
.PHONY: all dotfiles homebrew nvm settings tools zsh

all: tools dotfiles settings

tools: homebrew nvm zsh

dotfiles:
	ln -nfsv $(CURDIR)/git/gitconfig $(HOME)/.gitconfig
	ln -nfsv $(CURDIR)/git/gitignore_global $(HOME)/.gitignore_global
	mkdir -p $(HOME)/Library/Application\ Support/Code/User && ln -nfsv $(CURDIR)/vscode/settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json
	ln -nfsv $(CURDIR)/zsh/zshrc $(HOME)/.zshrc
	ln -nfsv $(CURDIR)/zsh/themes/nenu.zsh-theme $(HOME)/.oh-my-zsh/themes/nenu.zsh-theme
	ln -nfsv $(CURDIR)/hyper/hyper.js $(HOME)/.hyper.js
	mkdir -p $(HOME)/.ssh && ln -nfsv $(CURDIR)/ssh/config $(HOME)/.ssh/config

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

zsh:
	sudo bash -c "echo $$(which zsh) >> /etc/shells"
	chsh -s $$(which zsh)
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$$::g')"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	mkdir -p $(HOME)/.oh-my-zsh/custom/plugins/nvm-auto-use && curl https://raw.githubusercontent.com/tomsquest/nvm-auto-use.zsh/master/nvm-auto-use.zsh -o $(HOME)/.oh-my-zsh/custom/plugins/nvm-auto-use/nvm-auto-use.plugin.zsh

# It installs the following settings:
#  - Enables macOS subpixel antialiasing. This is optional for machines with Retina display.
settings:
	defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
