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
    read -n 1
    printf "\n"
}

# Link all of the files in the base directory into $HOME.
symlink_files() {
    declare -a FILES_TO_SYMLINK
    FILES_TO_SYMLINK=($(find . -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name . | sed -e 's|//|/|' | sed -e 's|./.|.|' | sort))
    FILES_TO_SYMLINK+=(".tldr")

    for i in ${FILES_TO_SYMLINK[@]}; do
        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then
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
# Change the system default shell to zsh

install_packages
setup_vim
setup_tmux

chsh -s `which zsh`
