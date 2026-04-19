{
  pkgs,
  username,
  ...
}: {
  home.packages = [
    (import ./squirtle.nix {inherit pkgs;})
    (import ./hypr-lid-close.nix {inherit pkgs;})
    (import ./wololo.nix {inherit pkgs;})
    (import ./nvidia-offload.nix {inherit pkgs;})
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ./screenshootin.nix {inherit pkgs;})
  ];
}
