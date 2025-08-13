{ config, pkgs, ...}:

{
    # Define a user account. Don't forget to set a password with 'passwd'.
	users.users.maze =
	{
		isNormalUser = true;
		description = "maze";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};
}
