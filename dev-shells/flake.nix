{
  description = "Master flake for dev shells";

  nixConfig = {
    extra-substituters = "https://devenv.cachix.org";
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
  };
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
    go-overlay = {
      url = "github:purpleclay/go-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    go = {
      url = "./go";
      inputs.devenv.follows = "devenv";
      inputs.flake-utils.follows = "flake-utils";
      inputs.go-overlay.follows = "go-overlay";
    };
    r = {
      url = "./r";
      inputs.devenv.follows = "devenv";
      inputs.flake-utils.follows = "flake-utils";
    };
    rust = {
      url = "./rust";
      inputs.devenv.follows = "devenv";
      inputs.flake-utils.follows = "flake-utils";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    uv = {
      url = "./python/uv";
      inputs.devenv.follows = "devenv";
      inputs.flake-utils.follows = "flake-utils";
    };
    uv-cuda = {
      url = "./python/uv-cuda";
      inputs.devenv.follows = "devenv";
      inputs.flake-utils.follows = "flake-utils";
    };

  };

  outputs =
    {
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells = {
        go = inputs.go.devShells.${system}.default;

        python = {
          uv = inputs.uv.devShells.${system}.default;
          uv-cuda = inputs.uv-cuda.devShells.${system}.default;
        };

        r = inputs.r.devShells.${system}.default;

        rust = inputs.rust.devShells.${system}.default;
      };
    });
}
