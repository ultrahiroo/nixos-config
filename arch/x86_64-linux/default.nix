{ pkgs, ... }:
{
  imports = [
    ./steam
    ./virtualbox
    ./wine
  ];
  environment.systemPackages = with pkgs; [
    cpu-x
    custom.codon
    discord
    looking-glass-client
    protonup-qt
    unityhub
  ];
}
