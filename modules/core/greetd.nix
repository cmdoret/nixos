{
  pkgs,
  host,
  username,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
