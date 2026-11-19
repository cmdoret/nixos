{pkgs, ...}: {
  xdg = {
    enable = true;
    configFile."mimeapps.list".force = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "default-web-browser" = ["firefox.desktop"];
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/about" = ["firefox.desktop"];
        "x-scheme-handler/unknown" = ["firefox.desktop"];
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
      };
    };
    # hyprland portal + config come from wayland.windowManager.hyprland;
    # gtk provides the file chooser and dark-mode (Settings) portals.
    portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
    systemDirs.data = [
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    ];
  };
}
