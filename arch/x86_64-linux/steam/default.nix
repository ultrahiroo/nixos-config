{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            migu
          ];
      };
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
    gamescope = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };
}
