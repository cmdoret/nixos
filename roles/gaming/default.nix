{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./steam.nix
  ];

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      lutris
      osu-lazer-bin
    ];
  };
}
