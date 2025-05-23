let
  set_1 = {
    nested_set = {
      list_value = [ "a" ];
      unique_value = "1";
      value = "same";
    };
  };
  set_2 = {
    nested_set = {
      list_value = [ "b" ];
      unique_value = "2";
      value = "same";
    };
  };
  set_3 = {
    nested_set = {
      list_value = [ "b" ];
      unique_value = "3";
      value = "same";
    };
  };
  x = [ set_1 set_2 set_3 ];

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

in
  mergeList x

