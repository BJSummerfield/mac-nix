{ pkgs, self, ... }:
let
  systemConfig = import ./system.nix { inherit pkgs self; };
  homebrewConfig = import ./homebrew.nix { };
  packagesConfig = import ./packages.nix { inherit pkgs; };
in
systemConfig // homebrewConfig // packagesConfig
