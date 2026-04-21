{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "cmdoret";
  gitEmail = "cyril.mattheydoret@gmail.com";

  # Hyprland Settings
  # ex: extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  extraMonitorSettings = "monitor = HDMI-A-1,2560x1440@120,auto,1";
  
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

  # Set hyprland images
  # among files in ./modules/home/hyprland/avatar, filename only, must be .jpg
  avatarImage = "dynastes-neon.jpg";
  # among files in ./wallpapers, filename only
  lockScreenImage = "china-skyscrapers-night.jpg";
  rofiImage = "neon-buildings-down.jpg";
  # See:
  # * supported: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
  # * gallery: https://tinted-theming.github.io/tinted-gallery/
  theme = "dracula";
  # Autogenerate theme based on this image if theme is null.
  stylixImage = ../../wallpapers/neon-buildings-down.jpg;

  # See:
  # * supported: https://github.com/NotAShelf/nvf/blob/main/modules/plugins/statusline/lualine/lualine.nix
  # * gallery: https://github.com/nvim-lualine/lualine.nvim/blob/a94fc68960665e54408fe37dcf573193c4ce82c9/THEMES.md
  vimLineTheme = "dracula";

  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-dynamic.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
