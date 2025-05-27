{ specialArgs, ... }: let
  all_normal_username = [
    "one"
  ];
  merge =
    lhs: rhs:
    lhs // rhs // (builtins.mapAttrs (
      rName: rValue:
      let
        lValue = lhs.${rName} or null;
      in
      if builtins.isAttrs lValue && builtins.isAttrs rValue then
        merge lValue rValue
      else if builtins.isList lValue && builtins.isList rValue then
        lValue ++ rValue
      else
        rValue
    ) rhs);
  mergeList = builtins.foldl' merge {};

  forEach = xs: f: map f xs;
  all_user = forEach all_normal_username (
    x: { ${x} = { imports = [ ./${x} ]; }; }
  );

in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
    backupFileExtension = "backup";
    users = (mergeList all_user);
  };
}
