{
  description = "Terminal emulator laucher";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      packageName = "terminal_emulator";
      pythonVersion = "python312";
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
        inherit system;
      });
    in
    {
      packages = forAllSystems ({ pkgs, system }: {
        default = let
            python = pkgs.${pythonVersion};
          in
          python.pkgs.buildPythonApplication {
            name = packageName;
            src = ./.;
          };
      });
    };
}
