{ pkgs, ... }:
{
  imports = [
    ./davinci-resolve
  ];
  home.packages = with pkgs; [
    cpu-x
    custom.codon
    discord
    looking-glass-client
    protonup-qt
    unityhub
  ];
}
