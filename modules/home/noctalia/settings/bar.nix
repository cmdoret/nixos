{ pkgs }:
let
  sysmon = stat: extra: { type = "sysmon"; show_label = false; inherit stat; } // extra;
  colored = { color = "primary"; icon_color = "on_surface"; };
in
{
  bar.default = {
    position = "top";
    capsule = false;
    margin_ends = 0;
    start = [
      "control-center"
      "bluetooth"
      "network"
      "mic"
      "volume"
      "media"
      "audio_visualizer"
    ];
    center = [ "taskbar" ];
    end = [
      "cpu"
      "cpu_temp"
      "ram"
      "net_rx"
      "net_tx"
      "disk"
      "battery"
      "clock"
      "notifications"
      "tray"
    ];
  };

  widget = {
    "control-center" = {
      custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/256x256/apps/nix-snowflake.png";
    };
    network = {
      vpn_status = "both";
      show_vpn_label = true;
      show_label = false;
    };
    media = {
      hide_when_no_media = true;
    };
    audio_visualizer = {
      enabled = false;
      show_when_idle = false;
    };
    taskbar = {
      group_by_workspace = true;
      workspace_group_content = "dots";
      show_workspace_label = false;
      hide_empty_workspaces = false;
      show_window_title = false;
      focused_color = "primary";
    };
    mic = {
      type = "volume";
      device = "input";
      show_label = true;
    };
    volume = {
      device = "output";
      show_label = true;
    };
    cpu = sysmon "cpu_usage" colored;
    cpu_temp = sysmon "cpu_temp" colored;
    ram = sysmon "ram_pct" colored;
    net_rx = sysmon "net_rx" colored;
    net_tx = sysmon "net_tx" colored;
    disk = sysmon "disk_used_pct" colored // { path = "/"; };
    battery = {
      display_mode = "graphic";
      scale = 0.8;
      show_label = false;
      hide_when_full = false;
    };
    clock = {
      format = "{:%H:%M}";
      vertical_format = "{:%H\n%M}";
    };
    notifications = {
      hide_when_no_unread = false;
    };
    tray = {
      drawer = true;
      pinned = [ "Slack" "Vesktop" "Steam" ];
    };
  };
}
