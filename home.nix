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
      ls = "eza";
      lg = "lazygit";
    };
  };

  programs.git = {
    enable = true;
    userName = "BJSummerfield";
    userEmail = "brianjsummerfield@gmail.com";
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha_transparent";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        mouse = false;
        end-of-line-diagnostics = "hint";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        inline-diagnostics.cursor-line = "hint";
      };
    };
    languages = {
      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };
      language = [
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
      ];
    };
    themes = {
      catppuccin_mocha_transparent = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = { };
      };
    };
    extraPackages = with pkgs; [
      rust-analyzer
      nodePackages.prettier
      nodePackages.typescript-language-server
      typescript
      marksman
      nil
      nixd
      nixpkgs-fmt
    ];
  };
  programs.zoxide.enable = true;
  programs.starship.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
