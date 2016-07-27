# dotfiles

Dotfiles for my Debian-based setup.
It's a relatively minimalistic configuration; as one German Scientist Man once said:

> Everything should be made as simple as possible, but not simpler.
>
> -- German Scientist Man

## Setup

Once all the necessary packages (see the *scripts* folder) are installed, do the following things:
* sudo: `sudo adduser <username> sudo`
* Change shell: `chsh -s $(which zsh)`
* Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* Copy-paste for URxvt: [guide](https://nixmeal.wordpress.com/2012/07/24/copypaste-text-in-urxvt-rxvt-unicode-using-keyboard/)
* Install [i3-gaps](https://github.com/Airblader/i3/wiki/Compiling-&-Installing)
* Install [dmenu2](https://bitbucket.org/melek/dmenu2)
* Install the [Monoid font](http://larsenwork.com/monoid/)
* Less critical things:
    * Install [JDK](https://wiki.debian.org/JavaPackage)
    * Install [lein](http://leiningen.org/)
    * Install [Arc-Darker](https://github.com/horst3180/arc-theme.git) from source and setup using **lxappearance**
