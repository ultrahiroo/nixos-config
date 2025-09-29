{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rio
    ];
  };
}
