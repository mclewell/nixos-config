{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/de/gnome.nix
  ];

  networking = {
    hostName = "thinkpad";
    #useDHCP = true;
  };

  system.stateVersion = "22.11";
}
