export ZSH="/Users/joonaskeppo/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias e="emacs"
alias hrs="cd ~/Documents/Hommat/HRS/repos"
alias doom="~/.config/emacs/bin/doom"
alias tidy="/usr/local/bin/tidy"

export MYVIMRC="$HOME/.config/nvim/init.vim"
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
