{
  description = "First Flakes Setup";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    	nixosConfigurations = {
		nixos = lib.nixosSystem{
			inherit system;	
        		modules = [ ./configuration.nix ];
			};
		};
        homeConfigurations."sarun" = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
                modules = [ 
			./home.nix 
			nixvim.homeManagerModules.nixvim
		];
      };
    };
}
