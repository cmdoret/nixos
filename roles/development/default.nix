{ pkgs, inputs, lib, config, ... }:
let
  docker-sbx = let
    drv = pkgs.callPackage ../../packages/docker-sbx {docker-sbx = drv; };
  in drv;
in 
{
  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      docker-sbx
      kubectl
      kubelogin
      kubelogin-oidc
      nodejs
      uv
      zed-editor
    ];
  };
}
