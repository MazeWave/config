{ config, pkgs, ... }:

let
  unstablePkgs = import <nixpkgs-unstable> { config.allowUnfree = true; };
  # myOverlay = self: super: {
  #   gnome-shell = unstablePkgs.gnome-shell;
  #   gnome-control-center = unstablePkgs.gnome-control-center;
  #   gnome-terminal = unstablePkgs.gnome-terminal;
  # };
in
{
  # nixpkgs.overlays = [ myOverlay ];

  environment.systemPackages = with pkgs; [
    # gnome-shell
    # gnome-control-center
    # gnome-terminal

    # your usual stuff
    pkgs.gnome-shell

    # unstablePkgs.gnome.gnome-shell
    unstablePkgs.gnome-control-center
    unstablePkgs.gnome-terminal
  ];

  services.xserver.desktopManager.gnome.enable = true;
}
      