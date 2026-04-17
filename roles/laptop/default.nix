{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./power.nix
    ./fprintd.nix
  ];

  config = lib.mkIf config.laptop {
    environment.systemPackages = with pkgs; [
      upower
    ];
  };
}
