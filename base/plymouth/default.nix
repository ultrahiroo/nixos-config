{ pkgs, ... }:
let
  delay = "4";
in
{
  boot = {
    plymouth = {
      enable = true;
      theme = "circle_hud";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "circle_hud" ];
        })
      ];
      # theme = "breeze";

      # extraConfig = ''
      #   [Daemon]
      #   ShowDelay=${delay}
      # '';
    };
  };

  # systemd.services.plymouth-quit = {
  #   preStart = "${pkgs.coreutils}/bin/sleep ${delay}";
  # };

  # systemd.services.plymouth-wait-for-animation = {
  #   description = "Waits for Plymouth animation to finish";
  #   before = [
  #     "plymouth-quit.service"
  #     "display-manager.service"
  #   ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.coreutils}/bin/sleep ${delay}";
  #   };
  #   wantedBy = [
  #     "plymouth-start.service"
  #   ];
  # };

  # boot = {
  #   kernelParams = [
  #     "plymouth.use-simpledrm"
  #   ];
  # };
}
