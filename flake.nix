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
      system = "aarch64-darwin";
      customOverlays = import ./overlays;
      # pkgs = import nixpkgs {
      #   system = system;
      #   overlays = customOverlays;
      #   # config = {
      #   #   allowUnfree = true;
      #   # };
      # };
      configuration = import ./config {
        pkgs = import nixpkgs;
        self = self;
      };
    in
    {
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "brian";
            };
          }

          { nixpkgs.overlays = customOverlays; }

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
