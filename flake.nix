{
  description = "First Flakes Setup";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = { url = "github:nix-community/nixvim"; };
  };

  outputs = { nixpkgs,nixpkgs-unstable, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix
            {
              nixpkgs.config.allowUnfree = true;
              _module.args.unstablePkgs = pkgsUnstable; # Pass to configuration.nix
            }
          ];

        };
      };
      homeConfigurations."sarun" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix 
          nixvim.homeManagerModules.nixvim 
         {
            _module.args.unstablePkgs = pkgsUnstable; # Pass to home.nix
          }
        ];
      };
    };
}
