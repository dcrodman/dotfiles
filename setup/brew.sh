#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install zsh tmux
brew install bash-completion
brew install httpie wget
brew install vim
brew install icdiff
brew install mysql
brew install aspell

brew install git

brew install pyenv
brew install ruby
brew install go delve

# Needed for tmux config.
brew install reattach-to-user-namespace

# Remove outdated versions from the Cellar
brew cleanup

echo "Note: Some things require manual installtion:"
echo "Postgres.app (http://postgresapp.com/)"
echo "Firefox"
echo "SublimeText 3"
echo "Visual Studio Code"
echo "1Password"
