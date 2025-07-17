{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    samba
    winetricks
    wineWowPackages.fonts
    wineWowPackages.stable
    wineWowPackages.waylandFull
    wineWowPackages.yabridge
  ];
  boot.binfmt.registrations."x86_64-windows".interpreter = "${pkgs.wineWowPackages.stable}/bin/wine64";
  # environment.sessionVariables = {
  #   WINE_BIN = "${pkgs.wine64}/bin/wine";
  #   WINESERVER_BIN = "${pkgs.wine64}/bin/wineserver";
  # };
}
