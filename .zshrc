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
export PATH="/usr/local/Cellar/llvm/18.1.8/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export INCLUDE_PATH="/usr/local/include:$INCLUDE_PATH"
export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
