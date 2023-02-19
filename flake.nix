{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Allows Firefox Extensions
    nur.url = "github:nix-community/NUR";
    #nur.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs: 
  {
    nixosConfigurations = {
      vm-nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ ./hosts/vm-nixos ];
      };
      lpatop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ ./hosts/thinkpad ];
      };

    };

    homeConfigurations = {
      "matthew@vm-nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ({
            nixpkgs.overlays = [ 
              nur.overlay
            ];   
          })
          ./home/matthew/vm-nixos.nix 
        ];
      };
      "matthew@thinkpad" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ({
            nixpkgs.overlays = [ 
              nur.overlay
            ];   
          })
          ./home/matthew/thinkpad.nix 
        ];
      };
    };
  };

}
