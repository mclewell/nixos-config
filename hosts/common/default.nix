{ lib, inputs, config, pkgs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./users.nix
    ./ssh.nix
  ];

  home-manager = {
    useUserPackages = true;
    #extraSpecialArgs = { inherit inputs outputs; };
  }; 

  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Map registries to channels
    # Very useful when using legacy commands
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };

  hardware.enableRedistributableFirmware = true;
  
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
  };

  time.timeZone = lib.mkDefault "America/Chicago";

  environment.systemPackages = with pkgs; [
    wget
    htop
    vim
    tree
    gptfdisk
    git
  ];

  services.fwupd.enable = true;
}
