{
  description = "R environment using devenv.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devenv.url = "github:cachix/devenv";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    devenv,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};

        rModules = import ./r-env.nix {
          inherit pkgs;
        };
      in {
        devShells.default = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = rModules;
        };
      }
    );
}
