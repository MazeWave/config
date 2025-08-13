{ config, pkgs, ... }:

{
	programs.zsh =
	{
		enable = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases =
		{
			m = "make";
			mr = "make re";
			mf = "make fclean";
			mc = "make clean";
			movie = "ssh -o StrictHostKeyChecking=no watch.ascii.theater";
			coffee = "ssh -o StrictHostKeyChecking=no terminal.shop";
			nrs = "sudo nixos-rebuild switch";
			nru = "sudo nixos-rebuild switch --upgrade";
			nxclean = "sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system; sudo nix-collect-garbage -d;";
			cat = "bat";
			# cd = "z";
		};
		oh-my-zsh =
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
		
		# Add zsh-autoenv functionality via initContent
		initContent = ''
			# zsh-autoenv functionality
			if [[ -f .autoenv ]]; then
				source .autoenv
			fi
		'';
	};
}