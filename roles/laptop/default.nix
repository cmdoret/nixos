{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./fprintd.nix
    ./pam.nix
    ./power.nix
  ];

  config = lib.mkIf config.laptop.enable {
    environment.systemPackages = with pkgs; [
      upower
    ];
  };
}
