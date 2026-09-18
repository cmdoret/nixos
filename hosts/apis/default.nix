{...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
    ./yoga-tablet.nix
  ];
  roles = [ "development" "laptop" "music" "office" "torrent"];
}
