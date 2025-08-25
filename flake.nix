{
  description = "First Flakes Setup";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url =
      "github:nixos/nixpkgs/nixos-unstable"; # Add unstable packages

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = { url = "github:nix-community/nixvim"; };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable =
        nixpkgs-unstable.legacyPackages.${system}; # Extract unstable packages
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            {
              nixpkgs.config.allowUnfree = true; # Allow unfree packages
              _module.args.unstablePkgs =
                pkgsUnstable; # Pass unstablePkgs to NixOS config
            }
          ];
        };
      };

      homeConfigurations."sarun" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
          {
            _module.args.unstablePkgs =
              pkgsUnstable; # Pass unstablePkgs to Home Manager
          }
        ];
      };
    };
}
