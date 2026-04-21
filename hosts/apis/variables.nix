{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "cmdoret";
  gitEmail = "cyril.mattheydoret@gmail.com";

  # Hyprland Settings
  # ex: extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  extraMonitorSettings = ''
    monitor = eDP-1,3840x2400@60,0x0,2
    monitor = DP-5,preferred,3840x2400,1
  '';
  
  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = true;

  # Set hyprland images
  # among files in ./modules/home/hyprland/avatar, filename only, must be .jpg
  avatarImage = "sdsc.jpg";
  # among files in ./wallpapers, filename only
  lockScreenImage = "pine.jpg";
  rofiImage = "pine.jpg";
  # See: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
  theme = "gruvbox-dark";
  # Autogenerate theme based on this image if theme is null.
  stylixImage = ../../wallpapers/pine.jpg;


  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
