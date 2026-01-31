{
  all_normal_username,
  inputs,
  lib,
  ...
}:
let
  mergeList = inputs.merge-list.lib.mergeList;
  all_user = lib.forEach all_normal_username (x: {
    ${x} = {
      imports = [
        ./${x}
      ];
    };
  });
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    users = (mergeList all_user);
  };
}
