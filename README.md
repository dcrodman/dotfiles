What Is This?
============

This repository contains the bulk of my dotfiles configuration, which can be paired
with a customized per-environment repository if you provide your own local versions.
There's nothing crazy here, mostly just configs for macOS defaults, zsh, git, tmux, etc.

Largely inspired by https://github.com/paulirish/dotfiles.

Installation
============

This will clone the repository and set you up with all of the necessary symlinks:

    git clone --recursive git@github.com:dcrodman/dotfiles.git
    cd dotfiles
    chmod +x init/bootstrap.sh && ./init/bootstrap.sh
    
Extra Steps
============

There are some other things you'll need to do in order to get this fully functional:
1. Generate or copy SSH keys
1. Open tmux and run

    Ctrl+a + I

1. Install pyenv versions
1. Nab the stuff from prefs and put those in the right places.

Troubleshooting
============

If antigen bundles are misbehaving, try forcing a reinstall:

    rm -rf ~/.antigen
