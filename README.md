What Is This?
============

This repository contains the bulk of my dotfiles configuration, which can be paired
with a customized per-environment repository if you provide your own local versions.
There's nothing crazy here, mostly just configs for macOS defaults, zsh, git, tmux, etc.

Installation
============

This will clone the repository and set you up with all of the necessary symlinks:

    git clone --recursive git@github.com:dcrodman/dotfiles.git
    cd dotfiles && ./install
    
Extra Steps
============

There are some other things you'll need to do in order to get this fully functional:
Open tmux and run

    Ctrl+a + I

Run one or more of the scripts in `setup/`: 

    # OSX
    setup/osx.sh
    setup/brew.sh

Open vim and run

    :PluginInstall

Install pyenv versions

    pyenv install 3.7.0

Generate or copy SSH keys

Troubleshooting
============

If antigen bundles are misbehaving, try forcing a reinstall:

    rm -rf ~/.antigen
