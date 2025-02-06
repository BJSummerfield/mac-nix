{ pkgs, ... }:

{
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  home.file = {
    ".config/ghostty".source = dotfiles/ghostty;
    ".config/aerospace".source = dotfiles/aerospace;
  };

  home.sessionVariables = { };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      source /Users/brian/.config/op/plugins.sh
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
    extraConfig =
      {
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP2G3biYuL3iFvhAXYNuVzvRpAQMmFFLek3KFZV4PfDu";
        gpg = {
          ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          format = "ssh";
        };
        commit.gpgSign = true;
      };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        language = "en";
        theme = {
          activeBorderColor = [
            "#f5e0dc"
            "bold"
          ];
          inactiveBorderColor = [ "#a6adc8" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#f5e0dc" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" ];
        };
      };
    };
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
        {
          name = "rust";
          formatter = {
            command = "rustfmt";
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
      # rust-analyzer
      # rustfmt
      # rustc
      # clippy
      # cargo
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

