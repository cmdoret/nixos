{ pkgs, host, lib, config, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) printEnable;
in {
  config = lib.mkIf config.office {
    services = {
      printing = {
        enable = printEnable;
        drivers = [
          pkgs.hplipWithPlugin
        ];
      };
      avahi = {
        enable = printEnable;
        nssmdns4 = true;
        openFirewall = true;
      };
      ipp-usb.enable = printEnable;
    };
  };
}
