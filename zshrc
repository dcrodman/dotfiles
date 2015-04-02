export HISTSIZE=99999
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zhistory
export CLICOLOR=1

source ~/.zsh/antigen/antigen.zsh

for f in ~/.zsh/*.zsh; do
	source $f
done