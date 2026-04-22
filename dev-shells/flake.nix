{
  description = "Master flake for dev shells";

  nixConfig = {
    extra-substituters = "https://devenv.cachix.org";
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
  };

  inputs = {
    nixpkgs.url      = "github:cachix/devenv-nixpkgs/rolling";
    flake-utils.url  = "github:numtide/flake-utils";
    devenv.url       = "github:cachix/devenv";
    go-overlay.url   = "github:purpleclay/go-overlay";
    go-overlay.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, flake-utils, devenv, go-overlay, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ go-overlay.overlays.default ];
        };
        mkShell = modules: devenv.lib.mkShell { inherit pkgs inputs; modules = modules; };
      in {
        devShells = {
          go      = mkShell (import ./go/go-env.nix          { inherit pkgs; });
          r       = mkShell (import ./r/r-env.nix            { inherit pkgs; });
          rust    = mkShell (import ./rust/rust-env.nix      { inherit pkgs; });
          uv      = mkShell (import ./python/uv/uv-env.nix   { inherit pkgs; });
          uv-cuda = mkShell (import ./python/uv-cuda/uv-cuda-env.nix { inherit pkgs; lib = pkgs.lib; });
        };
      }
    );
}
