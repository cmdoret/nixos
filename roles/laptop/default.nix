{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./power.nix
    ./fprintd.nix
  ];

  config = lib.mkIf config.laptop.enable {
    environment.systemPackages = with pkgs; [
      upower
    ];
  };
}
