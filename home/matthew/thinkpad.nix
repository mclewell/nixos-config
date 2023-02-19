{ inputs, pkgs, outputs, ... }:
{
  imports = [
    ./common
    ./gui
  ];

  home.packages = with pkgs; [
  ];
}
