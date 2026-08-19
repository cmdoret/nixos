{ pkgs, lib, config, ... }:
{
  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      azure-cli
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
