What Is This?
============

This repository contains the bulk of my dotfiles configuration, which can be paired
with a customized per-environment repository if you provide your own local versions.
There's nothing crazy here, mostly just configs for macOS defaults, zsh, git, tmux, etc.

Installation
============

    git clone --recursive git@github.com:dcrodman/dotfiles.git
    cd dotfiles
    ./install
    # optionally:
    scripts/setup.sh 
    

This will clone the repository and set you up with all of the necessary symlinks.
There are some other things you'll need to do in order to get this fully functional:
* Run one or more of the scripts in setup/. For OS X, use osx.sh and brew.sh
* Open vim and run :PluginInstall
* Open tmux and run Ctrl+a + I
* Install pyenv versions
