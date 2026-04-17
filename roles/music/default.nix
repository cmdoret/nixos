{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.music {
    environment.systemPackages = with pkgs; [
      audacity
      feishin
      picard
      rhythmbox
      supersonic
    ];
  };
}
