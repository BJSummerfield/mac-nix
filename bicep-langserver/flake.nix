{
  description = "A simple derivation for bicep language server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        bicepLangServer = pkgs.stdenv.mkDerivation rec {
          pname = "bicep-langserver";
          version = "0.33.93";

          src = pkgs.fetchzip {
            url = "https://github.com/Azure/bicep/releases/download/v${version}/bicep-langserver.zip";
            sha256 = "sha256-MDm2ZKcbgfxUa7h4PrtqgmvreLqnbso1Dc6y0uvar1A=";
            stripRoot = false;
          };

          installPhase = ''
            mkdir -p $out/bin
            cp -r $src $out/bin/Bicep.LangServer/

            cat <<EOF > $out/bin/bicep-langserver
            #!/usr/bin/env bash
            exec dotnet $out/bin/Bicep.LangServer/Bicep.LangServer.dll "\$@"
            EOF
  
            # Make the script executable
            chmod +x $out/bin/bicep-langserver
          
          '';
        };

      in
      {
        packages.bicep-langserver = bicepLangServer;
      });
}
