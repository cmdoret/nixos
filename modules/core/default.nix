{pkgs, inputs, ...}: {
  imports = [
    ./boot.nix
    ./evolution.nix
    ./flatpak.nix
    ./fonts.nix
    ./greetd.nix
    ./hardware.nix
    ./mullvad.nix
    ./network.nix
    ./nfs.nix
    ./nh.nix
    ./nix-ld.nix
    ./nix.nix
    ./packages.nix
    ./restic.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./syncthing.nix
    ./system.nix
    ./thunar.nix
    ./user.nix
    ./virtualisation.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];

}
