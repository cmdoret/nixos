{ pkgs, config, lib, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      # Keep the last 10 generations
      systemd-boot.configurationLimit = lib.mkDefault 10;
    };
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    plymouth.enable = true;
  };
}
