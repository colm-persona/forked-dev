#!/usr/bin/env bash

mkdir -pv ../env/.config

# copy config dirs
for dir in nvim tmux fish; do
  cp -R ~/.config/$dir/ ../env/.config/$dir
  rm -rf ../env/.config/$dir/.git # remove git artifacts
done

# copy config files
cp ~/.tmux.conf ../env/.tmux.conf
