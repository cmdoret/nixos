{ pkgs, lib, config, ... }:
{
  imports = [
    ./printing.nix
  ];

  config = lib.mkIf config.office.enable {
    environment.systemPackages = with pkgs; [
      slack
      zoom-us
    ];
  };
}
