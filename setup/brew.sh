#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install tmux
# Needed for tmux config.
brew install reattach-to-user-namespace

brew install zsh bash-completion
brew install httpie wget
brew install icdiff
brew install aspell

brew install git
brew install vim
brew install asdf

brew install mysql
brew install python pyenv
brew install ruby
brew install go delve

# Remove outdated versions from the Cellar
brew cleanup
