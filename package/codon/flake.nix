{
  description = "A high-performance, zero-overhead, extensible Python compiler using LLVM";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packageName = "codon";
        version = "v0.19.0";
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = packageName;
          pname = packageName;
          version = version;
          src = builtins.fetchurl {
            url = "https://github.com/exaloop/codon/releases/download/${version}/codon-linux-x86_64.tar.gz";
            sha256 = "sha256:1ll1iyyz80mvx1clv40m2l0wm7lq5h9yqms8m8ymcibv0gkh3dbl";
          };
          nativeBuildInputs = [
            pkgs.autoPatchelfHook
          ];
          buildInputs = [
            pkgs.stdenv.cc.cc.lib
            pkgs.libz
          ];
          sourceRoot = ".";
          installPhase = ''
            mv codon-deploy $out
          '';
        };
      }
    );
}
