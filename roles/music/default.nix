{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.music.enable {
    environment.systemPackages = with pkgs; [
      audacity
      feishin
      jellyfin-desktop
      picard
      rhythmbox
      supersonic
    ];
  };
}
