# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/$HOME/Downloads/code-stable-x64-1707853307/VSCode-linux-x64/bin"

ZSH_THEME="jonathan"
ENABLE_CORRECTION="true"

plugins=(git)

alias fu="flatpak update"
alias m="make"
alias mr="make re"
alias mf="make fclean"
alias mc="make clean"
alias movie="ssh -o StrictHostKeyChecking=no watch.ascii.theater"
alias nrs="sudo nixos-rebuild switch"
alias nru="sudo nixos-rebuild switch --upgrade"
# nrs() {
#   su -c "nixos-rebuild switch" "$USER"
# }
# nru() {
#   su -c "nixos-rebuild switch --upgrade" "$USER"
# }

alias nxclean="sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage -d | tail -n 1"
alias cat="bat"
# alias canfree="nix-store --gc --print-dead"

source $HOME/.zshrc