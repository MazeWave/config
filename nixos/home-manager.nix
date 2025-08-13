{ config, pkgs, ... }:

{
	imports = [ <home-manager/nixos> ];

	# Configure Home Manager to backup conflicting files
	home-manager.backupFileExtension = "backup";
	
	home-manager.users.maze =
	{
		imports =
		[
			./pkgs/firefox.nix
			./pkgs/zsh.nix
			./pkgs/hyprland.nix
		];

		# Home Manager settings
		home.stateVersion = "25.05"; # Update this to the current version of Home Manager
		home.enableNixpkgsReleaseCheck = false; # Disable version mismatch warnings
		home.packages = with pkgs;
		[
			# MEDIA
			vlc
			localsend
			jellyfin
			tidal-hifi
			# steam
			discord
			vesktop
			bitwarden-desktop
			# transmission_3
			#	modrinth-app
			#	minecraft
			#	obs-studio
			#	obsidian
			#	blender

			# CODE IDEs
			vscode
			# kdePackages.kdeconnect-kde
			valent
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
			zoxide
			neofetch
			fastfetch

			# GNOME DE
			gnome-tweaks
			gnome-software
			# gnome-shell-extension-open-bar

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

			# DOCKER
			# docker
			# docker-compose
		];

		# Programs configuration will be handled by imported modules
	};
}