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
      looking-glass-client
      protonup-qt
      unityhub
  ];
}
