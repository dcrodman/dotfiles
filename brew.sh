#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install python
brew install ruby
brew install go
brew install wget
brew install vim
brew install zsh

brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install sublime-text3
brew cask install iterm2
brew cask install dropbox
brew cask install spotify
brew cask install steam

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps