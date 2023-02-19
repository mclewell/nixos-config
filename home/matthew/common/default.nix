{ inputs, lib, pkgs, config, ... }:
{
  imports = [
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./vim.nix
  ];

  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
 
  home = {
    username = "matthew";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "22.11";
  };
 
}
