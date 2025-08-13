{ config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable required services for Hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # XDG portal for screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Essential packages for Hyprland
  environment.systemPackages = with pkgs; [
    waybar                    # Status bar
    rofi-wayland             # Application launcher
    dunst                    # Notification daemon  
    swww                     # Wallpaper daemon
    grim                     # Screenshot tool
    slurp                    # Screen area selection
    wl-clipboard             # Clipboard utilities
    brightnessctl            # Brightness control
    pamixer                  # Audio control
    playerctl                # Media player control
    networkmanagerapplet     # Network manager GUI
  ];

  # This should be configured in home-manager for per-user config
  # The actual Hyprland config will go in home-manager.nix
}