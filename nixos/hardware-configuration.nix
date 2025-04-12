# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/dcc13c03-f196-42e6-aa2f-d099da11d21a";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-8d4a04ac-27b3-477c-8859-6fcd7fd7e6b4".device = "/dev/disk/by-uuid/8d4a04ac-27b3-477c-8859-6fcd7fd7e6b4";

  swapDevices =
    [ { device = "/dev/disk/by-uuid/87e4c43c-c256-440b-8823-7de752612605"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.hypervGuest.enable = true;
}
