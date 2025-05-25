{ all_username, ... }: {
  programs.ydotool = {
    enable = true;
    group = "ydotool";
  };
  users.groups.ydotool.members = all_username;
}
