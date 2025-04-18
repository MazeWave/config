# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/ldalmass/Downloads/code-stable-x64-1707853307/VSCode-linux-x64/bin"

ZSH_THEME="jonathan"
ENABLE_CORRECTION="true"

plugins=(git)

alias fu="flatpak update"
alias m="make"
alias mr="make re"
alias mf="make fclean"
alias mc="make clean"
alias movie="ssh -o StrictHostKeyChecking=no watch.ascii.theater"
alias nrs="nixos-rebuild switch"
alias nxclean="sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage -d; "
alias cat="bat"
# alias canfree="nix-store --gc --print-dead"

# source $ZSH/oh-my-zsh.sh