{
  description = "clean command";
  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      packageName = "clean";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "${packageName}";
        src = self;
        buildInputs = with pkgs; [
          clang
        ];
        buildPhase = "cc -o ${packageName} ${./clean.c}";
        installPhase = ''
          mkdir -p $out/bin
          cp ${packageName} $out/bin/
        '';
      };
      defaultPackage = self.packages.${system}.${packageName};
    }
  );
}
