{inputs, nixpkgs, ...}:
{
  nixpkgs.overlays = [
    (final: prev: {
      sshwarm = inputs.sshwarm.packages.${final.stdenv.hostPlatform.system}.default;
    })
  ];
}
