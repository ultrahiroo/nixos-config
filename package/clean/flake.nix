{
  description = "clean command";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        packageName = "clean";
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = packageName;
          # src = self;
          src = ./.;
          # buildInputs = with pkgs; [
          #   clang
          # ];
          buildPhase = "cc -o ${packageName} ${./clean.c}";
          installPhase = ''
            mkdir -p $out/bin
            cp ${packageName} $out/bin/
          '';
        };
      }
    );
}
