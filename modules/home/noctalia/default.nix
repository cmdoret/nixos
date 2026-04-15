{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        usb-drive-manager = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
      pluginSettings = {
        tailscale = {
          compactMode = true;
          hideDisconnected = true;
        };
        usb-drive-manager = {
          hideWhenEmpty = true;
          autoMount = false;
        };
      };
    };
    settings = {
      # configure noctalia here
      bar = {
        density = "default";
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
            }
            {
              id = "plugin:tailscale";
            }
          ];
          center = [
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "SystemMonitor";
              compactMode = false;
              usePadding = true;
              showNetworkStats = true;
              showDiskUsage = true;
              showDiskAvailable = true;
            }
            {
              id = "Battery";
              alwaysShowPercentage = false;
              warningThreshold = 30;
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              id = "Tray";
            }
            {
              id = "plugin:usb-drive-manager";
            }
          ];
        };
      };
      controlCenter.cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = true;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
      ];
      systemMonitor = {
        tempWarningThreshold = 70;
        tempCriticalThreshold = 85;
        useCustomColors = true;
        warningColor = "#B89D61";
        criticalColor = "#B8765A";
      };
      colorSchemes.predefinedScheme = "Monochrome";
      appLauncher = {
        iconMode = "native";
      };
      dock = {
        enabled = true;
        dockType = "attached";
        colorizeIcons = true;
        showLauncherIcon = true;
        groupApps = true;
        groupClickAction = "list";
        groupIndicatorStyle = "dots";
      };
      general = {
        avatarImage = "~/.face.icon";
        radiusRatio = 1;
        lockScreenAnimations = true;
        lockScreenBlur = 0.25;
        lockScreenTint = 0.25;
      };
      location = {
        monthBeforeDay = false;
      };
    };
    # this may also be a string or a path to a JSON file.
  };
}
