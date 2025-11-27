{...}: {
  imports = [
    ./hardware.nix
    ../../modules/core/steam.nix
    ./host-packages.nix
  ];
}
