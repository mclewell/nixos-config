{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/de/gnome.nix
  ];

  networking = {
    hostName = "vm-nixos";
    #useDHCP = true;
  };

  services.qemuGuest.enable = true;

  system.stateVersion = "22.11";
}
