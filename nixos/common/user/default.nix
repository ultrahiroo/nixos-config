{ pkgs, username, ... }: {
  users.users.${username} = {
    group = username;
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
  users.groups.${username} = {};
}
