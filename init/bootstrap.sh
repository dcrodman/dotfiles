#!/usr/bin/env zsh

# Inspited by/stolen from https://github.com/paulirish/dotfiles/blob/master/symlink-setup.sh.

print_result() {
    [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

execute() {
    eval $1
    if [[ $? -eq 0 ]]; then
        print_success $2
    else
        print_error $2
    fi
}

ask_for_confirmation() {
    printf "\e[0;33m  [?] $1 (y/n)\e[0m"
    read -rs -k 1 reply
    echo
    case "${reply}" in
    y|Y|$'\n')
        return 0
        ;;
    *)
        return 1
        ;;
    esac
}

# Link all of the files in the base directory into $HOME.
symlink_files() {
    declare -a FILES_TO_SYMLINK
    FILES_TO_SYMLINK=($(find . -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .vscode -not -name . | sed -e 's|//|/|' | sed -e 's|./.|.|' | sort))
    declare -a DIRS_CONTENTS_ONLY
    DIRS_CONTENTS_ONLY=()

    # Symlink only the contents of these directories, not the directories themselves.
    for d in ${DIRS_CONTENTS_ONLY[@]}; do
        targetDir="$HOME/$(printf "%s" "$d" | sed "s/.*\/\(.*\)/\1/g")"
        if [[ ! -d "$targetDir" ]]; then
            mkdir $targetDir
        fi

        files=($(find $d -maxdepth 1 -not -name $d -not -name .DS_Store))
        for f in ${files[@]}; do
            FILES_TO_SYMLINK+=($f)
        done
    done

    # Symlink the rest of the files.
    for i in ${FILES_TO_SYMLINK[@]}; do
        # Skip over any directories in DIRS_CONTENTS_ONLY, else we'd symlink them anyway.
        if [[ " ${DIRS_CONTENTS_ONLY[*]} " =~ " ${i} " ]]; then
            continue
        fi

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
                if ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"; then
                    rm -rf "$targetFile"
                    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi
            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi
    done
}

osx_defaults() {
    if [[ `uname` == "Darwin" ]]; then
        source $(pwd)/init/osx.sh
    fi
}

install_packages() {
    if [[ `uname` == "Darwin" ]]; then
        if [ `command -v brew` ]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        fi
        export PATH=/opt/homebrew/bin:$PATH

        brew tap homebrew/cask-fonts
        brew install font-hack-nerd-font --cask

        brew install \
            zsh \
            antigen \
            starship \
            bash-completion \
            tmux \
            reattach-to-user-namespace \
            wget \
            knqyf263/pet/pet \
            ripgrep \
            nmap \
            jq \
            git \
            vim \
            pyenv \
            rbenv \
            go
    else
        sudo apt-get install \
            zsh \
            tmux \
            git-core \
            vim \
            ripgrep \
            mysql-server \
            postgresql \
            python

        curl https://pyenv.run | bash
        curl -fsSL https://starship.rs/install.sh | bash
    fi
}

setup_vim() {
    if [ -d "$HOME/.vim" ]; then
        print_success "~/.vim already exists (skipping)"
    else
        # Install Vundle.
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
        # Install the plugins from vimrc.
        vim +PluginInstall +qall
    fi
}

setup_tmux() {
    if [ -d "$HOME/.tmux" ]; then
        print_success "~/.tmux already exists (skipping)"
    else
        # Install Tmux Plugin Manager.
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
}

symlink_files
osx_defaults
install_packages
setup_vim
setup_tmux

# Change the system default shell to zsh
chsh -s `which zsh`
