{
  config,
  pkgs,
  lib,
  username,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        #command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland --time --time-format '(TYS) %Y-%m-%d %H:%M' --remember-session";
        command = "${pkgs.tuigreet}/bin/tuigreet --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
      };
    };
  };
}
