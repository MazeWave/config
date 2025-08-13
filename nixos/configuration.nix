# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
	[ 
	#  "/home/maze/config/nixos/unstable-pkgs.nix"
		./user.maze.nix
		./hyprland.nix
		./home-manager.nix
	];

	# Enables Flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Set your time zone.
	time.timeZone = "Europe/Monaco";

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
	services.pulseaudio.enable = false;
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

		# docker.enable = true;
	};

	

	# Enable automatic login for the user.
	services.displayManager.autoLogin.enable = true;
	services.displayManager.autoLogin.user = "maze";

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
		kitty
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
	system.stateVersion = "25.05";
	programs.zsh.enable = true;
}
