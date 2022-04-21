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
1. Run `chmod +x setup/setup.sh && setup/setup.sh`
1. Generate or copy SSH keys
1. Open tmux and run

    Ctrl+a + I

1. Open vim and run

    :PluginInstall

1. Install pyenv versions
1. Install Cobalt2 iterm font https://github.com/wesbos/Cobalt2-iterm

Troubleshooting
============

If antigen bundles are misbehaving, try forcing a reinstall:

    rm -rf ~/.antigen
