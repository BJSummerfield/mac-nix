{ pkgs, ... }:
let
  mpls = pkgs.buildGoModule
    {
      pname = "mpls";
      version = "unstable";

      src = pkgs.fetchFromGitHub
        {
          owner = "mhersson";
          repo = "mpls";
          rev = "main";
          hash = "sha256-NiNWyR1qmNj5IsFh1gZEBiXBTN7k6R6zkB1HULYKisI=";
        };
      vendorHash = "sha256-xILlYrwcnMWAPACeELwVKGUBIK9QbrUSR03xVmNXsnE=";
      meta =
        {
          description = "Markdown preview language server";
          homepage = "https://github.com/mhersson/mpls";
          mainProgram = "mpls";
        };
    };
in
{
  programs.helix = {
    languages = {
      language-server = {
        mpls = {
          command = "${pkgs.mpls}/bin/mpls";
          args = [ "--dark-mode" "--enable-emoji" ];
        };
      };
      language = [
        {
          name = "markdown";
          auto-format = true;
          language-servers = [ "mpls" "marksman" ];
        }
      ];
      extraPackages = with pkgs; [
        mpls
        marksman
      ];
    };
  };

  # home.packages = [
  #   mpls
  # ];
}
