{
  description = "Go environment using devenv.";

  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    flake-utils.url = "github:numtide/flake-utils";
    devenv.url = "github:cachix/devenv";
    go-overlay = {
      url = "github:purpleclay/go-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      devenv,
      go-overlay,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ go-overlay.overlays.default ];
        };

        goModules = import ./go-env.nix {
          inherit pkgs inputs;
        };
      in
      {
        devShells.default = devenv.lib.mkShell {
          inherit pkgs inputs;
          modules = goModules;
        };
      }
    );
}
