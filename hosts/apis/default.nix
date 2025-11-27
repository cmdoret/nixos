{...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
    ../../modules/core/steam.nix
  ];
}
