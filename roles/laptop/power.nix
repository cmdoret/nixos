{ pkgs, host, lib, config, ... }:
{
  config = lib.mkIf config.laptop.enable {
    environment.systemPackages = with pkgs; [
      upower
    ];
    powerManagement = {
      enable = true;
    };
    services.upower = {
      enable = true;
    };
    services.power-profiles-daemon.enable = true;
  };
}
