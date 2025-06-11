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
          hash = "sha256-MGrvJOnjNNXU8Z9rqDIacb5awKxf50xYeNkY06U4cUk=";
        };
      vendorHash = "sha256-n3DG3sR7HOQPQJW1t1qC94EKkDBgXpdmjUWtLzAE7kY=";
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
