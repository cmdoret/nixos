{ pkgs, inputs, username, host, ... }: let
  inherit (import ../../../hosts/${host}/variables.nix) lockScreenImage terminal;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "/home/${username}/Pictures/Wallpapers/${lockScreenImage}";
    };
  };
  # configure options
  programs.noctalia-shell = {
    enable = true;
    package = (inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override { 
      calendarSupport = true; 
    });
    plugins = import ./plugins.nix {inherit username terminal;};
    settings = import ./settings {inherit terminal;};
    # this may also be a string or a path to a JSON file.
  };
}
