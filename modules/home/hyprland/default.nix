{host, ...}: let
  inherit (import ../../../hosts/${host}/variables.nix) animChoice;
in {
  imports = [
    animChoice
    ./binds.nix
    ./env.nix
    ./hyprland.nix
    ./pyprland.nix
    ./windowrules.nix
    # replaced by noctalia (idle + lockscreen)
    #./hypridle.nix
    #./hyprlock.nix
  ];
}
