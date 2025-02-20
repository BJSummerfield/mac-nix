{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    taplo
    _1password-cli
    helix
    zoxide
    fish
    git
    starship
    eza
    lazygit
    gh
  ];

  fonts.packages = with pkgs; [ nerd-fonts.monaspace ];
}
