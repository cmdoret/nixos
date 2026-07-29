{config, pkgs, lib, host, ...}:
{
  stylix.targets = {
    anki.enable = true;
    fcitx5.enable = true;
    firefox.enable = true;
    ghostty.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    k9s.enable = true;
    nvf.enable = true;
    obsidian.enable = true;
    qt.enable = true;
    rofi.enable = false;
    starship.enable = true;
    vesktop.enable = true;
    waybar.enable = false;
    zathura.enable = true;
    zed.enable = true;
  };

  # replicates https://github.com/nix-community/stylix/blob/master/modules/noctalia/hm.nix
  # (the noctalia v5 target only landed after release-26.05)
  programs.noctalia = {
    settings = {
      theme = {
        source = "custom";
        custom_palette = "stylix";
        mode = if config.stylix.polarity == "dark" then "dark" else "light";
      };
      shell.font_family = config.stylix.fonts.sansSerif.name;
    };

    customPalettes.stylix.dark = with config.lib.stylix.colors.withHashtag; {
      mPrimary = base0D;
      mOnPrimary = base00;
      mSecondary = base0E;
      mOnSecondary = base00;
      mTertiary = base0C;
      mOnTertiary = base00;
      mError = base08;
      mOnError = base00;
      mSurface = base00;
      mOnSurface = base05;
      mHover = base0C;
      mOnHover = base00;
      mSurfaceVariant = base01;
      mOnSurfaceVariant = base04;
      mOutline = base03;
      mShadow = base00;

      terminal = {
        foreground = base05;
        background = base00;
        cursor = base05;
        cursorText = base00;
        selectionFg = base05;
        selectionBg = base02;
        normal = {
          black = base00;
          red = base08;
          green = base0B;
          yellow = base0A;
          blue = base0D;
          magenta = base0E;
          cyan = base0C;
          white = base05;
        };
        bright = {
          black = base03;
          red = base08;
          green = base0B;
          yellow = base0A;
          blue = base0D;
          magenta = base0E;
          cyan = base0C;
          white = base07;
        };
      };
    };
  };
}
