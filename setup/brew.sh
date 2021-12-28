#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# Environment & shell.
brew install zsh starship bash-completion tmux
# (needed for tmux config)
brew install reattach-to-user-namespace
# Tools.
brew install wget knqyf263/pet/pet ripgrep tldr
# Development stuff.
brew install git vim pyenv go

# Remove outdated versions from the Cellar
brew cleanup
