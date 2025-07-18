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
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set hyprland imagess
  # among files in ./modules/home/hyprland/avatar, filename only, must be .jpg
  avatarImage = "bombyx.jpg";
  # among files in ./wallpapers, filename only
  lockScreenImage = "beautifulmountainscape.jpg";
  rofiImage = "voxels3d.png";
  # Set Stylix Image
  stylixImage = ../../wallpapers/beautifulmountainscape.jpg;

  # Syntax highlighting theme in neovim
  # See: https://github.com/NotAShelf/nvf/blob/main/modules/plugins/theme/supported-themes.nix
  vimTheme = "github";
  #  See: https://github.com/nvim-lualine/lualine.nvim/blob/a94fc68960665e54408fe37dcf573193c4ce82c9/THEMES.md
  vimLineTheme = "horizon";

  # Set Waybar
  #  Available Options:
  #waybarChoice = ../../modules/home/waybar/waybar-simple.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs-2.nix;
  #waybarChoice = ../../modules/home/waybar/Jerry-waybar.nix;
  waybarChoice = ../../modules/home/waybar/waybar-curved.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-dynamic.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
