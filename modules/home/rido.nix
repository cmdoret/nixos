{
  config,
  pkgs,
  inputs,
  ...
}:
let
  storeRoot = "${config.xdg.dataHome}/rido/store";
in
{
  home.packages = [
    inputs.rido.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."rido/config.json".text = builtins.toJSON { inherit storeRoot; };

  systemd.user.tmpfiles.rules = [
    "d ${config.xdg.dataHome}/rido 0700 - - -"
    "d ${storeRoot} 0700 - - -"
  ];
}
