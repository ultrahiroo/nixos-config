{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      dejavu_fonts
      material-design-icons
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      plemoljp
      plemoljp-nf
      plemoljp-hs
      source-code-pro
      source-han-code-jp
    ];
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Color Emoji"
        ];
        monospace = [
          "DejaVu Sans Mono"
          "Noto Color Emoji"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
