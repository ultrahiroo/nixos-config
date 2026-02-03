{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      kdiskmark
    ];
  };
}
