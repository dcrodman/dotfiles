#!/usr/bin/env bash
#
# Convenience script for running the appropriate setups depending on the target platform
# and handling a few other installation steps.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
unamestr=`uname`

if [[ $unamestr == "Darwin" ]]; then
	bash $DIR/brew.sh
	bash $DIR/osx.sh
else; then
	bash $DIR/linux.sh
fi

### Python (pyenv)
pyenv install 3.7.3
pyenv global 3.7.3
pip install --upgrade pip

### Go (gvm)
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.14.4
go use go.1.14.4 --default