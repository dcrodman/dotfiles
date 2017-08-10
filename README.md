Installation
============

    cd /path/to/somewhere
    git clone --recursive git@github.com:dcrodman/dotfiles.git
    cd dotfiles
    ./install

This will clone the repository and set you up with all of the necessary symlinks.
There are some other things you'll need to do in order to get this fully functional:
* Run one or more of the scripts in setup/. For OS X, use osx.sh and brew.sh
* Open vim and run :PluginInstall
* Open tmux and run Ctrl+b + I
* Copy SublimeText config files into place if you want those
