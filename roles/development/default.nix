{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      kubectl
      kubelogin
      kubelogin-oidc
      nodejs
      uv
      zed-editor
    ];
  };
}
