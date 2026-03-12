{ config, lib, pkgs, inputs, ... }:
let
  system = pkgs.system;

  antigravity =
    inputs.antigravity-jail.packages.${system}.default;

in
{

  environment.systemPackages = [
    antigravity
  ];

}
