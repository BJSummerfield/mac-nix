{ pkgs, self, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = "nix-command flakes";

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    show-recents = false;
    autohide-time-modifier = 0.0;
    tilesize = 1;
  };

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;

  users.knownUsers = [ "brian" ];
  users.users.brian = {
    name = "brian";
    home = "/Users/brian";
    uid = 501;
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
