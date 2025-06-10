{ all_username, ... }:
{
  programs.adb.enable = true;
  users.groups = {
    adbusers.members = all_username;
  };
}
