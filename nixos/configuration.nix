# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ldalmass = {
    isNormalUser = true;
    description = "ldalmass";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
	vlc
#	steam
	discord
	tidal-dl
	tidal-hifi
	jellyfin
#	modrinth-app
#	minecraft
	bitwarden-desktop
	transmission_3
#	obs-studio
#	obsidian
	localsend
	scrcpy
	audacity
#	blender
#	heroic

	# Code IDEs
	vscode
#	clion
#	rider
#	rust-rover
#	idea-community
#	pycharm-community
	# Video editing
#	davinci-resolve
	avidemux
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "ldalmass";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	git
	vim
	wget
	curl
	android-tools
  oh-my-zsh


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

programs = {
   zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
          m = "make";
          mr = "make re";
          mf = "make fclean";
          mc = "make clean";
          movie = "ssh -o StrictHostKeyChecking=no watch.ascii.theater";
          nrs = "sudo nixos-rebuild switch";
      };
      ohMyZsh = {
         enable = true;
         theme = "jonathan";
         plugins = [
           "git"
           "history"
           "rust"
         ];
      };
   };
};

programs.firefox = {
  enable = true;
  policies = {
    RestoreOnStartup = 1;
    DisableTelemetry = true;
    SearchEngines = {
      Default = "Startpage";
      PreventInstalls = true;
    };

    Homepage = {
      StartPage = "https://startpage.com";
      URL = "https://startpage.com";
    };
    SearchBar = "unified"; # or "separate"
    Extensions = {
      Install = [
        "https://addons.mozilla.org/firefox/downloads/file/4146722/ublock_origin-latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4465727/sponsorblock-latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4451438/styl_us-latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4439735/darkreader-latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4467426/bitwarden_password_manager-latest.xpi"
      ];
    };
  };
};



}
