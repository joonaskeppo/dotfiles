#!/bin/bash

PKGS=(redshift
      git
      suckless-tools
      i3status
      make	
      sudo	
      feh
      curl
      tmux
      newsbeuter
      xclip
      xinput
      pkg-config
      build-essential
      rxvt-unicode
      fonts-inconsolata
      lxappearance
      zsh
      mpv)
INST="apt-get install ${PKGS[@]}"

echo "
Updating package lists...
" &&

apt-get update &&

echo "
Installing packages...
" &&

${INST} &&

echo "
All done!
"
