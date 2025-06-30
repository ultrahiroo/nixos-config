{ inputs, ... }:
{
  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin Mocha";
      };
      themes = {
        "Catppuccin Mocha" = {
          src = "${inputs.catppuccin-bat}/themes";
          file = "Catppuccin Mocha.tmTheme";
        };
      };
    };
  };
  home.sessionVariables = {
    PAGER = "bat";
  };
}
