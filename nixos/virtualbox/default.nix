{ lib, pkgs, username, ... }: {
  virtualisation.virtualbox.host.enable = pkgs.stdenv.isx86_64;
  users.extraGroups.vboxusers.members = lib.optionals pkgs.stdenv.isx86_64 [ username ];
}
