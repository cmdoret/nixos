{ pkgs, inputs, username, host, ... }: let
  inherit (import ../../../hosts/${host}/variables.nix) lockScreenImage;
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
              compactMode = true;
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
              id = "Tray";
            }
            {
              id = "Notifications";
            }
            {
              id = "plugin:usb-drive-manager";
              editHideWhenEmpty = true;
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
        lockScreenBlur = 0.50;
        lockScreenTint = 0.33;
        showHibernateOnLockScreen = true;
        enableLockScreenMediaControls = true;
        autoStartAuth = true;
        allowPasswordWithFprintd = true;
      };
      location = {
        monthBeforeDay = false;
      };
      colorSchemes = {
        useWallpaperColors = true;
        darkMode = true;
        generationMethod = "tonal-spot";
      };
    };
    # this may also be a string or a path to a JSON file.
  };
}
