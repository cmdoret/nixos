# Based on https://lavafroth.is-a.dev/post/cuda-on-nixos-without-sacrificing-ones-sanity/
{
  description = "Python ML dev shell with CUDA and micromamba";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default =
      (pkgs.buildFHSEnv {
        name = "ml-cuda";

        targetPkgs = pkgs:
          with pkgs; [
            bash
            binutils
            ffmpeg
            freeglut
            libGL
            libGLU
            linuxPackages.nvidia_x11
            micromamba
            ncurses5
            stdenv.cc
            xorg.libX11
            xorg.libXext
            xorg.libXi
            xorg.libXmu
            xorg.libXrandr
            xorg.libXv
            zlib
          ];

        profile = ''
          export LD_LIBRARY_PATH="${pkgs.linuxPackages.nvidia_x11}/lib"
          export CUDA_PATH="${pkgs.cudatoolkit}"
          export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
          export EXTRA_CCFLAGS="-I/usr/include"

          # Auto activate the micromamba env if it exists
          export MAMBA_ROOT_PREFIX=$PWD/.mamba
          eval "$(micromamba shell hook --shell=bash)"
          micromamba activate ml-cuda || echo "Run: micromamba env create -f environment.yml"
        '';

        runScript = "bash";
      }).env;
  };
}
