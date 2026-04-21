{}:
{
  density = "default";
  barType = "simple";
  position = "top";
  showCapsule = false;
  widgets = {
    left = [
      {
        id = "ControlCenter";
        useDistroLogo = true;
      }
      {
        id = "Bluetooth";
      }
      {
        id = "Network";
      }
      {
        id = "VPN";
        displayMode = "alwaysShow";
      }
      {
        id = "plugin:tailscale";
      }
      {
        id = "MediaMini";
        useFixedWidth =  true;
        hideWhenIdle = true;
        showVisualizer =  true;
        visualizerType = "wave";
      }
    ];
    center = [
      {
        id = "Workspace";
        hideUnoccupied = false;
        labelMode = "none";
        showApplications = true;
        showApplicationsHover = true;
        colorizeIcons = true;
        focusedColor = "primary";
        occupiedColor = "none";
        emptyColor = "none";
      }
    ];
    right = [
      {
        id = "Microphone";
        displayMode = "alwaysShow";
      }
      {
        id = "Volume";
        displayMode = "alwaysShow";
      }
      {
        id = "SystemMonitor";
        compactMode = true;
        showNetworkStats = true;
        showDiskUsage = true;
        showDiskAvailable = false;
      }
      {
        id = "Battery";
        alwaysShowPercentage = false;
        warningThreshold = 30;
        showNoctaliaPerformance = true;
        showPowerProfiles =true;
      }
      {
        id = "Clock";
        formatHorizontal = "HH:mm";
        formatVertical = "HH mm";
        useMonospacedFont = true;
        usePrimaryColor = true;
      }
      {
        id = "NotificationHistory";
      }
      {
        id = "Tray";
      }
      {
        id = "plugin:usb-drive-manager";
      }
    ];
  };
}
