{ lib, config, ... }:
let
  availableRoles = [
    "development"
    "gaming"
    "laptop"
    "music"
    "office"
    "torrent"
  ];
in
{
  # Dynamically generate options `<role>.enable = false`
  options = lib.genAttrs availableRoles (role: {
    enable = lib.mkEnableOption "${role} role";
  }) // {
  # This allows users to simplify specify roles through a list of enums.
    roles = lib.mkOption {
      type = lib.types.listOf (lib.types.enum availableRoles);
      default = [];
      description = "List of enabled roles";
    };
  };

  # Sets <role>.enable = true for roles specified in the list
  config = lib.mkMerge (
    map (
      role:
      lib.mkIf (lib.elem role config.roles) {
        ${role}.enable = true;
      }
    ) availableRoles
  );

  imports = map (role: ./${role}) availableRoles;
}
