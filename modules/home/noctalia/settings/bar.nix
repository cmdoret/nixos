{ }:
{
  bar.default = {
    position = "top";
    capsule = false;
    start = [
      "control-center"
      "bluetooth"
      "network"
      "media"
      "audio_visualizer"
    ];
    center = [ "taskbar" ];
    end = [
      "mic"
      "volume"
      "cpu"
      "cpu_temp"
      "ram"
      "net_rx"
      "net_tx"
      "disk"
      "battery"
      "power_profile"
      "clock"
      "notifications"
      "tray"
    ];
  };

  widget = {
    network = {
      vpn_status = "both";
      show_vpn_label = true;
      show_label = true;
    };
    media = {
      hide_when_no_media = true;
    };
    audio_visualizer = {
      show_when_idle = false;
    };
    taskbar = {
      group_by_workspace = true;
      workspace_group_content = "icons";
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
    cpu = {
      type = "sysmon";
      stat = "cpu_usage";
    };
    cpu_temp = {
      type = "sysmon";
      stat = "cpu_temp";
    };
    ram = {
      type = "sysmon";
      stat = "ram_pct";
    };
    net_rx = {
      type = "sysmon";
      stat = "net_rx";
    };
    net_tx = {
      type = "sysmon";
      stat = "net_tx";
    };
    disk = {
      type = "sysmon";
      stat = "disk_used_pct";
      path = "/";
    };
    battery = {
      show_label = false;
      hide_when_full = true;
    };
    clock = {
      format = "{:%H:%M}";
      vertical_format = "{:%H\n%M}";
    };
    notifications = {
      hide_when_no_unread = false;
    };
    tray = {
      pinned = [ "Slack" "Vesktop" "Steam" ];
    };
  };
}
