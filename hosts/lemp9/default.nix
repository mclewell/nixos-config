{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/de/gnome.nix
  ];

  networking = {
    hostName = "lemp9";
    #useDHCP = true;
  };

  system.stateVersion = "22.11";
}
