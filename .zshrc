############  Shell Settings ############
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zhistory
export CLICOLOR=1

# Antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh
# Plugins
antigen bundle brew
antigen bundle git
antigen bundle python
antigen bundle golang
# antigen theme geoffgarside
# antigen theme bhilburn/powerlevel9k powerlevel9k
# antigen theme af-magic
antigen apply

########## $PATH modifications ##########

# macOS only
if [[ `uname` == 'Darwin' ]]; then
    # Homebrew path on M1 macs.
    if [[ -d /opt/homebrew ]]; then
        export PATH=/opt/homebrew/bin:$PATH
    fi

    # Path definitions are here so that OSX's path_helper doesn't ruin things.
    export PATH=$PATH:/usr/local/bin:/opt/X11/include:/opt/X11/bin

	# Include VSCode binaries on path if we have it installed.
    if [ -e /Applications/Visual\ Studio\ Code.app ]; then
        export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
    fi

    # Sublime Text
    if [ -e /Applications/Sublime\ Text.app/Contents/SharedSupport/bin ]; then
        export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
    fi

    # Include the Postgres binaries from the latest version of Postgres installed through
    # Postgres.app. Prevents some inconsistencies with the Homebrew-installed tools.
    if [ -e /Applications/Postgres.app ]; then
        export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
    fi
fi

# Go
if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

######## Miscallaneous Env Vars #########


################ Aliases ################

if [[ `uname` == 'Darwin' ]]; then
    alias mysqlstart='mysql.server start'
    alias mysqlstop='mysql.server stop'
fi

# Tmux commands.
alias tn='tmux new'
alias tnd='tmux new -s dev'
alias ta='tmux attach #'
alias tad='tmux attach -t dev'

# Redis.
alias start-redis='redis-server /usr/local/etc/redis.conf'

############### Functions ###############


############# Setup Scripts #############

# Starship
if [ `command -v starship` ]; then
    eval "$(starship init zsh)"
fi

# rbenv
if [ `command -v rbenv` ]; then
    eval "$(rbenv init -)"
fi

# pyenv
eval "$(pyenv init -)"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#### Source a local zshrc if it exists for environment-specific configs.
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
