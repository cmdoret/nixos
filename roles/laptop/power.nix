{ lib, config, ... }:
{
  config = lib.mkIf config.laptop.enable {
    powerManagement = {
      enable = true;
    };
    services.upower = {
      enable = true;
    };
    services.power-profiles-daemon.enable = true;
  };
}
