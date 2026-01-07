#!/bin/bash

echo "Removing unused (orphan) libraries..."
sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null
sudo pacman -Scc --noconfirm

echo "Emptying trash..."
sudo rm -rf ~/.local/share/Trash/*
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
rm -rf ~/.cache/*

echo "Vacuuming logs..."
sudo journalctl --vacuum-time=1d
