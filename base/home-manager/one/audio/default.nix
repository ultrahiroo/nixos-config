{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pamixer # Command-line mixer for PulseAudio
    pavucontrol # PulseAudio Volume Control
    qjackctl # JACK Audio Connection Kit Qt GUI Interface
    qpwgraph # PipeWire Graph Qt GUI Interface
  ];
}
