#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

brew install knqyf263/pet/pet
brew install ripgrep
brew install tldr
brew install tmux
# Needed for tmux config.
brew install reattach-to-user-namespace

brew install zsh bash-completion
brew install httpie wget

brew install git
brew install vim

brew install pyenv

brew install starship

# Remove outdated versions from the Cellar
brew cleanup
