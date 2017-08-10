What Is This?
============

This repository contains the bulk of my dotfiles configuration, which can be paired
with a customized per-environment repository if you provide your own local versions.
There's nothing crazy here, mostly just configs for OS X defaults, zsh, git, tmux,
and vim/spacemacs.

Installation
============

    cd /path/to/somewhere
    git clone --recursive git@github.com:dcrodman/dotfiles.git
    cd dotfiles
    ./install
    chsh -s /usr/local/bin/zsh # or /usr/bin/zsh

This will clone the repository and set you up with all of the necessary symlinks.
There are some other things you'll need to do in order to get this fully functional:
* Run one or more of the scripts in setup/. For OS X, use osx.sh and brew.sh
* Open vim and run :PluginInstall
* Open tmux and run Ctrl+b + I
* Copy SublimeText config files into place if you want those
* Install pyenv (this is taken care of by brew.sh for macOS)
