{
  description = "";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      packageName = "davinci-resolve";
      version = "19.1.4";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "${packageName}";
        pname = "davinci-resolve";
        version = "v${version}";
        src = ./DaVinci_Resolve/DaVinci_Resolve_${version}_Linux.zip;
        nativeBuildInputs = with pkgs; [
          unzip
        ];
        buildInputs = with pkgs; [
          fusePackages.fuse_2
        ];
        unpackPhase = "unzip $src";
        installPhase = ''
          mkdir -p $out/bin
          cp ./DaVinci_Resolve_${version}_Linux.run $out/bin
        '';
      };
    }
  );
}
