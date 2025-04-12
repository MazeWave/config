#!/bin/sh

echo "Started rebuilding system"
nixos-rebuild switch --use-remote-sudo
echo "Finished rebuilding system"
