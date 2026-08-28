{ pkgs, lib, config, unstable, ... }:
{
  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      azure-cli
      unstable.docker-sbx
      kubectl
      kubelogin
      kubelogin-oidc
      nodejs
      uv
      zed-editor
    ];
  };
}
