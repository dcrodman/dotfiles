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

### Python specific packages
pyenv install 3.7.3
pyenv global 3.7.3

pip install --upgrade pip
pip install --user poetry
