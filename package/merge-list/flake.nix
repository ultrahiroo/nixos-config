{
  outputs =
    { ... }:
    {
      lib =
        let
          merge =
            lhs: rhs:
            lhs
            // rhs
            // (builtins.mapAttrs (
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
        in
        {
          mergeList = builtins.foldl' merge { };
        };
    };
}
