{...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];
  roles = [ "development" "gaming" "music" "torrent" ];
}
