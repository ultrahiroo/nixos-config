{ pkgs, ... }:
let
  get_script =
    x:
    (pkgs.writeScript "script-${x.number}.sh" ''
      ${x.command}
    '');

  get_mango_config_element =
    x:
    let
      command_path = "${x.snd}";
      number = "${x.fst.number}";
      alias_key = "${x.fst.alias_key}";
      appid = "${x.fst.appid}";
      title = "${x.fst.title}";
    in
    ''
      bind=ALT,${number},spawn_on_empty,${command_path},${number}
      bind=ALT,${alias_key},spawn_on_empty,${command_path},${number}
      exec-once=${command_path}
      windowrule=tags:${number},appid:${appid},title:${title}
    '';

  get_label =
    x:
    let
      number = "${x.number}";
      alias_key = "${x.alias_key}";
      name = "${x.name}";
      label = "${number} ${alias_key} ${name}";
    in
    label;

in
{
  get_mango_spawn_config =
    x:
    let
      script_list = map get_script x;
      mango_spawn_list = map get_mango_config_element (pkgs.lib.lists.zipLists x script_list);
      maomao_spawn_config = pkgs.lib.strings.concatStringsSep "\n" mango_spawn_list;
    in
    maomao_spawn_config;

  get_waybar_label =
    x:
    let
      waybar_label_list = map get_label x;
    in
    waybar_label_list;
}
