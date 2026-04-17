{ pkgs, inputs, lib, config, ... }:
{
  config = lib.mkIf config.torrent {
    environment.systemPackages = with pkgs; [
      qbittorrent
      (pkgs.callPackage ../../packages/stremio-enhanced { })
    ];
  };
}
