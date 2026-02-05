{ ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
  xdg.configFile."starship.toml" = {
    source = ./starship.toml;
    force = true;
  };
}
