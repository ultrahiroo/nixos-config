{ ... }: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation"
      ];
      extensions = [
        # {id = "";}
      ];
    };
  };
}
