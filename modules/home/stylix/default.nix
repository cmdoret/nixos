{config, pkgs, lib, host, ...}: 
{
  stylix.targets = {
    anki.enable = true;
    fcitx5.enable = true;
    ghostty.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    k9s.enable = true;
    noctalia-shell.enable = false;
    nvf.enable = true;
    qt.enable = true;
    rofi.enable = false;
    vesktop.enable = true;
    waybar.enable = false;
  };

  # replicates https://github.com/nix-community/stylix/commit/044ac0cc6d914f1dac22a728013bc3797f77cfab
  programs.noctalia-shell.colors = with config.lib.stylix.colors.withHashtag; {
    mPrimary = base0D;
    mOnPrimary = base00;
    mSecondary = base05;
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
  };
}
