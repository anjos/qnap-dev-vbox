#!/bin/bash

if [ -d dotfiles ]; then
  echo "[>>] Installing dotfiles..."
  mv dotfiles .dotfiles
  rm -fv .dotfiles/*~ .dotfiles/*.swp
  ln -sf ~/.dotfiles/bashrc ~/.bashrc
  ln -sf ~/.dotfiles/profile ~/.profile
  ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
  ln -sf ~/.dotfiles/curlrc ~/.curlrc
fi
