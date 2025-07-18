{ all_username, ... }:
{
  virtualisation.docker = {
    enable = true;
  };
  users.groups.docker.members = all_username;
}
