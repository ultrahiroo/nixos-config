{ pkgs, ... }:
{
  imports = [
    ./steam
    ./virtualbox
    ./windows
  ];
  environment.systemPackages = with pkgs; [
      cpu-x
      custom.codon
      # davinci-resolve
      discord
      looking-glass-client
      protonup-qt
      spotify
      unityhub
  ];
}
