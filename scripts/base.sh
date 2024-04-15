#!/usr/bin/env bash

echo "Setting up environment..."
sh ./setup.sh

echo "Copying environment config files..."
sh ./copy-env.sh

echo "Configuring tmux..."
sh ./tmux.sh

echo "Configuring nvim..."
sh ./nvim.sh

echo "Configuring fish..."
sh ./fish.sh
