{ inputs, pkgs, ... }:
{
  imports = [
    ./pkgs.nix
    ./firefox.nix
    ./gnome-dconf.nix
  ];
}
