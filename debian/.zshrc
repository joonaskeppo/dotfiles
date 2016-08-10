export ZSH=/home/keppo/.oh-my-zsh
ZSH_THEME='clean'
plugins=(git)

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:'
PATH+='/home/keppo/bin:/usr/local/heroku/bin'
export PATH

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' menu select # Press TAB twice to activate the autocompletion menu
setopt completealiases # Alias autocompletion
setopt HIST_IGNORE_DUPS # Ignore duplicates in history
stty -ixon # Disable XON/XOFF flow control (Ctrl-S Ctrl-Q hang)

# Aliases
alias aup='sudo apt-get update'
alias aug='sudo apt-get dist-upgrade'
alias au2='aup && aug'
alias ain='sudo apt-get install'
alias arm='sudo apt-get remove'
alias srch='apt-cache search'
alias rsy='redshift -O 3700'
alias rsn='redshift -x'
alias news='newsbeuter'

# Functions
mnt() {
    help="Usage: $0 [device]"
    if [ $# -ne 1 ]; then
        echo $help
    else
        sudo mkdir -p /mnt/$1
        sudo mount /dev/$1 /mnt/$1
    fi
}
umnt() {
    help="Usage: $0 [device]"
    if [ $# -ne 1 ]; then
        echo $help
    else
        sudo umount /mnt/$1
    fi
}
gitp() {
    help="Usage: $0 [branch] [commit message]"
    if [ $# -ne 2 ]; then
        echo $help
    else
        git add -A
        git commit -m $2
        git push -u origin $1
    fi
}
