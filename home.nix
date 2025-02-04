{ pkgs, ... }:

{
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  home.file = {
    ".config/ghostty".source = dotfiles/ghostty;
    ".config/aerospace".source = dotfiles/aerospace;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      '';
    shellAliases = {
      # ls = "eza";
      lg = "lazygit";
    };
  };
  # Let Home Manager install and manage itself.
  programs.zoxide.enable = true;
  programs.starship.enable = true;
  programs.home-manager.enable = true;
}
