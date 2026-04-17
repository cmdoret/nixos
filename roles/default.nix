{ lib, config, ... }:

let
  roles = [
    "development"
    "gaming"
    "laptop"
    "music"
    "office"
    "torrent"
  ];

  roleOptions = lib.listToAttrs (map (r: lib.nameValuePair r r) roles);
in
{
  options = lib.recursiveUpdate {
    roles = lib.mkOption {
      type = lib.types.listOf (lib.types.enum roles);
      default = [ ];
      description = "List of enabled roles";
    };
  } (lib.mapAttrs (role: _: lib.mkEnableOption "${role} role") roleOptions);

  config = lib.mapAttrs (role: _: lib.mkIf (lib.elem role config.roles) true) roleOptions;

  imports = map (role: ./${role}) roles;
}
