{
	description = "A very basic flake";

	inputs =
	{
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = inputs:
	let
		pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
	in
	{
		packages.x86_64-linux.default = pkgs.hello;
		packages.x86_64-linux.hello = pkgs.hello;


	};
}
