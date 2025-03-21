{
  description = "Nix Darwin Setup";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
    let
      # system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config = {
          allowUnfree = true;

        };
      };

      configuration = import ./config
        {
          pkgs = pkgs;
          self = self;
        };
    in
    {
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          #config
          configuration
          # homebrew 
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "brian";
            };
          }

          #overlays
          {
            nixpkgs.overlays = import ./overlays;
          }

          # home-manager
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brian = import ./home.nix;
          }
        ];
      };
    };
}
