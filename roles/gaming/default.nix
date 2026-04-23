{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./steam.nix
  ];

  config = lib.mkIf config.gaming.enable {
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      heroic
      lutris
      #osu-lazer-bin
    ];
  };
}
