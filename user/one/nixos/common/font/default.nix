{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      material-design-icons

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];

    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
