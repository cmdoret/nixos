{terminal}:
let
  hyprLoad = "hyprctl reload";
in 
{
  appLauncher = {
    terminalCommand = terminal;
    iconMode = "tabler";
    overviewLayer = true;
    density = "compact";
  };
  bar = import ./bar.nix {};
  controlCenter = import ./control-center.nix {};
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
  hooks = {
    enabled = true;
    screenUnlock = hyprLoad;
    startup = hyprLoad;
    session = hyprLoad;
  };
  idle = {
    enabled = true;
    screenOffTimeout = 300;
    lockTimeout = 330;
    suspendTimeout = 600;
  };
  location = {
    monthBeforeDay = false;
  };
  systemMonitor = {
    tempWarningThreshold = 70;
    tempCriticalThreshold = 85;
    useCustomColors = true;
    warningColor = "#B89D61";
    criticalColor = "#B8765A";
  };
  sessionMenu = import ./session-menu.nix {};
}
