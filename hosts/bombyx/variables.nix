{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "cmdoret";
  gitEmail = "cyril.mattheydoret@gmail.com";

  # Hyprland Settings
  # ex: extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  extraMonitorSettings = "monitor = eDP-1,2560x1440@60,auto,1.333";

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "ghostty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = true;

  # Set hyprland imagess
  # among files in ./modules/home/hyprland/avatar, filename only, must be .jpg
  avatarImage = "bombyx.jpg";
  # among files in ./wallpapers, filename only
  lockScreenImage = "beautifulmountainscape.jpg";
  rofiImage = "voxels3d.png";
  # See: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
  theme = "onedark";
  # Autogenerate theme based on this image if theme is null.
  stylixImage = ../../wallpapers/beautifulmountainscape.jpg;

  #  See: https://github.com/nvim-lualine/lualine.nvim/blob/a94fc68960665e54408fe37dcf573193c4ce82c9/THEMES.md
  vimLineTheme = "horizon";

  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-dynamic.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
