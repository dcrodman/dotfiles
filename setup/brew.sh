#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install zsh 
brew install git
brew install bash-completion
brew install pyenv
brew install ruby
brew install go
brew install wget
brew install httpie
brew install vim
brew install ack
brew install icdiff
brew install mysql
brew install aspell
brew install tmux

brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew cask install google-chrome
brew cask install sublime-text3
brew cask install iterm2

# Remove outdated versions from the Cellar
brew cleanup

# Link .app files into /Applications
brew linkapps

echo "Note: Some things require manual installtion:"
echo "Postgres.app (http://postgresapp.com/)"
echo "Spacemacs (https://github.com/syl20bnr/spacemacs#install)"
