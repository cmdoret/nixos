{pkgs, ...}: 
let
  # Workaround for freecad not working under nvidia+wayland: force X11
  freecadWrapped = pkgs.symlinkJoin {
    name = "FreeCAD";
    paths = [ pkgs.freecad ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      # Wrap binary
      wrapProgram $out/bin/FreeCAD \
        --set QT_QPA_PLATFORM xcb

    '';
  };
in
  {
  environment.systemPackages = with pkgs; [
    audacity
    feishin
    freecadWrapped # computer assisted design
    lutris
    obs-studio
    osu-lazer-bin
    vesktop
  ];
}
