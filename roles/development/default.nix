{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      kubectl
      nodejs
      uv
      zed-editor
      (pkgs.callPackage ../../packages/antigravity-jail {
        inherit (inputs) antigravity-nix jail-nix;
      })
    ];
  };
}
