{
  description = "Terminal emulator laucher";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs =
    { self, nixpkgs }:
    let
      packageName = "terminal";
      pythonVersion = "python313";
      allSystem = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystem =
        f: nixpkgs.lib.genAttrs allSystem (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
    {
      packages = forAllSystem (
        { pkgs }:
        {
          default =
            let
              python = pkgs.${pythonVersion};
            in
            python.pkgs.buildPythonApplication {
              name = packageName;
              src = ./.;
              pyproject = true;
              build-system = [ python.pkgs.setuptools ];
            };
        }
      );
    };
}
