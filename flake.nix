{
  description = "jdocmunch-mcp server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.writeShellApplication {
          name = "jdocmunch-mcp";
          runtimeInputs = [ pkgs.uv ];
          text = ''
            exec uvx jdocmunch-mcp "$@"
          '';
        };
      }
    );
}
