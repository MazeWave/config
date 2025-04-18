# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
  [ 
    "/home/ldalmass/config/nixos/unstable-pkgs.nix"
  ];

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings =
  {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Hyprland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # SERVICES
  services =
  {
    # Enable sound with pipewire.
    pipewire =
    {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Configure keymap in X11
    xserver.xkb =
    {
      layout = "us";
      variant = "intl";
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the X11 windowing system.
    xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ldalmass =
  {
    isNormalUser = true;
    description = "ldalmass";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs;
    [
      # MEDIA
      vlc
      localsend
      jellyfin
      tidal-hifi
      #	steam
      discord
      bitwarden-desktop
      transmission_3
      #	modrinth-app
      #	minecraft
      #	obs-studio
      #	obsidian
      #	blender

      # CODE IDEs
      vscode
      #	clion
      #	rider
      #	rust-rover
      #	idea-community
      #	pycharm-community

      # CREATION
      #	davinci-resolve
      audacity
      avidemux

      # SHELL
      scrcpy
      ffmpeg
      tidal-dl
      gnumake
      tree
      bat

      # HYPRLAND DE
      hyprlang
      # hyprgraphics
      # hyprland-qtutils
      hyprpaper
      hyprpicker
      hypridle
      hyprlock
      hyprpolkitagent
      # hyprsysteminfo
      xdg-desktop-portal-hyprland
      kitty
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ldalmass";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
  [
    git
    vim
    wget
    curl
    android-tools
    oh-my-zsh
    # Other WM
    # hyprland
    # wlroots

    #	nvidia-x11
    #	nvidia-settings
    #	nvidia-persistenced
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  programs =
  {
    zsh =
    {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases =
      {
          m = "make";
          mr = "make re";
          mf = "make fclean";
          mc = "make clean";
          movie = "ssh -o StrictHostKeyChecking=no watch.ascii.theater";
          nrs = "sudo nixos-rebuild switch";
          nxclean = "sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage -d;";
          cat = "bat";
      };
      ohMyZsh =
      {
          enable = true;
          theme = "jonathan";
          plugins =
          [
            "git"
            "history"
            "rust"
          ];
      };
    };
    firefox =
    {
      enable = true;
      policies =
      {
        RestoreOnStartup = 1;
        DisableTelemetry = true;
        SearchEngines =
        {
          Default = "Startpage";
          PreventInstalls = true;
        };

        Homepage =
        {
          StartPage = "https://startpage.com";
          URL = "https://startpage.com";
        };
        SearchBar = "unified"; # or "separate"
        Extensions =
        {
          Install =
          [
            "https://addons.mozilla.org/firefox/downloads/file/4458450/ublock_origin-latest.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4465727/sponsorblock-latest.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4451438/styl_us-latest.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4439735/darkreader-latest.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-latest.xpi"
            "https://addons.mozilla.org/firefox/downloads/file/4467426/bitwarden_password_manager-latest.xpi"
          ];
        };
      };
    };
    hyprland =
    { 
      enable = true;
    };
  };


  # Enable Hyprland
  # services.xserver.windowManager.hyprland.enable = true;

  # Enable LightDM display manager
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.defaultSession = "gnome";  # Set default session as GNOME
}