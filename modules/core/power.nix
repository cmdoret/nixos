
{
  pkgs,
  host,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) battery;
in {
  environment.systemPackages = with pkgs; [
    upower
  ];
  powerManagement = {
    enable = battery;
    powertop.enable = battery;
  };
  services.upower = {
    enable = battery;
  };
  services.power-profiles-daemon.enable = true;
}
