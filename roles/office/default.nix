{ pkgs, inputs, lib, config, ... }:
{
  imports = [
    ./printing.nix
  ];

  config = lib.mkIf config.office {
    environment.systemPackages = with pkgs; [
      libreoffice
      slack
    ];
  };
}
