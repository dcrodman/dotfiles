#!/bin/zsh

# Install homebrew if it isn't already installed
if ! hash brew 2> /dev/null; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

brew install zsh \
    # Environment & shell.
    starship \
    bash-completion \
    tmux \
    # (needed for tmux config)
    reattach-to-user-namespace \
    # Tools.
    wget \
    knqyf263/pet/pet \
    ripgrep \
    nmap \
    jq \
    # Development stuff.
    git \
    vim \
    pyenv \
    rbenv \
    go


# Remove outdated versions from the Cellar
brew cleanup
