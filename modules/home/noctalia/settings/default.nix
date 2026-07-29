{ wallpaper }:
let
  hyprLoad = "hyprctl reload";
in
{
  # bar hold widget *names*; their settings live in the [widget.*] tables
  inherit (import ./bar.nix { }) bar widget;

  shell = {
    avatar_path = "~/.face.icon";
    corner_radius_scale = 1.0;
    app_icon_colorize = true;
    date_format = "%A, %d %B";
    launcher.compact = true;
    session = import ./session-menu.nix { };
  };

  control_center = import ./control-center.nix { };

  dock = {
    enabled = true;
    margin_edge = 0;
    launcher_position = "start";
    show_dots = true;
    show_instance_count = true;
  };

  lockscreen = {
    fingerprint = true;
    blurred_desktop = true;
    blur_intensity = 0.5;
    tint_intensity = 0.33;
    inherit wallpaper;
  };

  wallpaper.default.path = wallpaper;

  battery.warning_threshold = 30;

  hooks = {
    started = hyprLoad;
    session_unlocked = hyprLoad;
    colors_changed = hyprLoad;
  };

  idle.behavior = {
    screen_off = {
      action = "screen_off";
      timeout = 300;
    };
    lock = {
      action = "lock";
      timeout = 330;
    };
    suspend = {
      action = "suspend";
      timeout = 600;
    };
  };

  system.monitor = {
    cpu_temp_activity_threshold = 70.0;
    cpu_temp_critical_threshold = 85.0;
    gpu_temp_activity_threshold = 70.0;
    gpu_temp_critical_threshold = 85.0;
  };

  # NOTE: v4's tailscale/usb-drive-manager have no v5 port
  # TODO: v5 seeds the official + community git -> enable later with
  # `plugins.enabled = [ "author/plugin" ]`
}
