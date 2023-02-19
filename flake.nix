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

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs: 
  {
    nixosConfigurations = {
      vm-nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ ./hosts/vm-nixos ];
      };
      thinkpad = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ ./hosts/thinkpad ];
      };
      lemp9 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ ./hosts/lemp9 ];
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
      "matthew@lemp9" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ({
            nixpkgs.overlays = [
              nur.overlay
            ];
          })
          ./home/matthew/lemp9.nix
        ];
      };
    };
  };
}
