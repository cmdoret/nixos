{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.rido.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
