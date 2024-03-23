export ZSH="/Users/joonaskeppo/.oh-my-zsh"
ZSH_THEME="robbyrussell-light"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias e="nvim"
alias tidy="/usr/local/bin/tidy"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
