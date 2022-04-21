#!/usr/bin/env bash
#
# Convenience script for running the appropriate setups depending on the target platform
# and handling a few other installation steps.

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
unamestr=`uname`

if [[ $unamestr == "Darwin" ]]; then
	bash $DIR/brew.sh
	bash $DIR/osx.sh
else
	bash $DIR/linux.sh
fi
