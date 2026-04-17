{...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];
  roles = [ "development" "laptop" "music" "office" ];
}
