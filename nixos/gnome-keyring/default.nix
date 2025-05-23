{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;

  # security.pam.services.login.enableGnomeKeyring = true;
  # security.pam.services.gdm-password.enableGnomeKeyring = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # security = {
  #   pam = {
  #     services = {
  #       ${username} = {
  #         kwallet = {
  #           enable = true;
  #           package = pkgs.kdePackages.kwallet-pam;
  #         };
  #       };
  #     };
  #   };
  # };
}
