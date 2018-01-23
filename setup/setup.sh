#!/usr/bin/env bash
#
# Convenience script for running the appropriate setups depending on the target platform.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
unamestr=`uname`

if [[ $unamestr == "Darwin" ]]; then
	bash $DIR/brew.sh
	bash $DIR/osx.sh
else; then
	bash $DIR/linux.sh
fi