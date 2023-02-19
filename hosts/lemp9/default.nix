{ pkgs, inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.system76
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
