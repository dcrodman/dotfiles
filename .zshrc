############  Shell Settings ############
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zhistory
export CLICOLOR=1

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

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Starship
if [ `command -v starship` ]; then
    eval "$(starship init zsh)"
fi

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###### Source a local zshrc if it exists for environment-specific configs. ######

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
