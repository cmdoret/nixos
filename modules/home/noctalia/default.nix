{ inputs, pkgs, username, host, ... }: let
  inherit (import ../../../hosts/${host}/variables.nix) lockScreenImage terminal;
  wallpaper = "/home/${username}/Pictures/Wallpapers/${lockScreenImage}";
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.sessionVariables.TERMINAL = terminal;

  programs.noctalia = {
    enable = true;
    settings = import ./settings { inherit pkgs; inherit wallpaper; };
  };
}
