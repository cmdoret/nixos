{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Tyler Kelley";
  gitEmail = "tylerzanekelley@gmail.com";

  # Hyprland Settings
  # ex: extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  extraMonitorSettings = "";

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable Printing Support
  printEnable = false;

  # Set hyprland images
  # among files in ./modules/home/hyprland/avatar, filename only, must be .jpg
  avatarImage = "sootball.jpg";
  # among files in ./wallpapers, filename only
  lockScreenImage = "beautifulmountainscape.jpg";
  # See:
  # * supported: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
  # * gallery: https://tinted-theming.github.io/tinted-gallery/
  theme = "dracula";
  # Autogenerate theme based on this image if theme is null.
  stylixImage = ../../wallpapers/nix-wallpaper-stripes-logo.png;

  # See:
  # * supported: https://github.com/NotAShelf/nvf/blob/main/modules/plugins/statusline/lualine/lualine.nix
  # * gallery: https://github.com/nvim-lualine/lualine.nvim/blob/a94fc68960665e54408fe37dcf573193c4ce82c9/THEMES.md
  vimLineTheme = "onedark";

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-def.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = false;
}
