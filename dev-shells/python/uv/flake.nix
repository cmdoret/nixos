{
  description = "Basic python environment using uv.";

  nixConfig = {
    extra-substituters = "https://devenv.cachix.org";
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
  };
  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
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
        pkgs = import nixpkgs {
          inherit system;
        };

        # python environment defined separately
        pythonModules = import ./python-uv.nix {
          inherit pkgs;
          inherit (pkgs) lib;
        };
      in {
        devShells = {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = pythonModules;
          };
        };
      }
    );
}
