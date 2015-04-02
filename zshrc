export HISTSIZE=99999
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zhistory
export CLICOLOR=1

source ~/.antigen_lnk/antigen.zsh

for f in ~/.zsh/*.zsh; do
	source $f
done

# Antigen Stuff
antigen use oh-my-zsh

antigen bundle git
antigen bundle brew
antigen bundle sublime
#antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme risto

antigen apply

# Source a local zshrc if it exists.
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

