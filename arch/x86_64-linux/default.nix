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
    davinci-resolve
    discord
    looking-glass-client
    protonup-qt
    unityhub
  ];
}
