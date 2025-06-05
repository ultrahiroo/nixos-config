{ inputs, ... }:
{
  system = {
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      allowReboot = false;
      flags = [
        "--update-input"
        "nixpkgs"
        "-L"
      ];
      dates = "02:00";
    };
  };
}
