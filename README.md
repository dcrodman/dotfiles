This repository contains the bulk of my dotfiles configuration, which can be paired
with a customized per-environment repository if you provide your own local versions.
There's nothing crazy here, mostly just configs for macOS defaults, zsh, git, tmux, etc.

Largely inspired by https://github.com/paulirish/dotfiles.

Installation
============

To install everything after cloning:

    chmod +x init/bootstrap.sh && ./init/bootstrap.sh

Troubleshooting
============

If antigen bundles are misbehaving, try forcing a reinstall:

    rm -rf ~/.antigen
