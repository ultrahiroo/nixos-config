{ all_normal_username, inputs, lib, specialArgs, ... }: let
  mergeList = inputs.merge-list.lib.mergeList;
  all_user = lib.forEach all_normal_username (
    x: { ${x} = { imports = [
      ./common
      ./${x}
    ]; }; }
  );
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
    backupFileExtension = "backup";
    users = (mergeList all_user);
  };
}
