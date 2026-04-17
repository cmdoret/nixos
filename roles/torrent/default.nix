{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.torrent.enable {
    environment.systemPackages = with pkgs; [
      qbittorrent
      (pkgs.callPackage ../../packages/stremio-enhanced { })
    ];
  };
}
