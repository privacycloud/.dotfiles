.DEFAULT_GOAL: all
.PHONY: all dotfiles homebrew nvm settings tools zsh

all: tools dotfiles settings

tools: homebrew nvm zsh gcloud

dotfiles:
	ln -nfsv $(CURDIR)/git/gitconfig $(HOME)/.gitconfig
	ln -nfsv $(CURDIR)/git/gitignore_global $(HOME)/.gitignore_global
	mkdir -p $(HOME)/.ssh && ln -nfsv $(CURDIR)/ssh/config $(HOME)/.ssh/config

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

zsh:
	curl -L http://install.ohmyz.sh | sh

gcloud:
	curl https://sdk.cloud.google.com | bash

# It installs the following settings:
#  - Enables macOS subpixel antialiasing. This is optional for machines with Retina display.
settings:
	defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
