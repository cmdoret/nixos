{
  description = "Master flake for dev shells";

  inputs = {
    # Bring in the subflakes
    ml-cuda.url = "./python/ml-cuda";
    uv.url = "./python/uv";

    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    ml-cuda,
    uv,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        shells = {
          "python.ml-cuda" = ml-cuda.devShells.${system}.default;
          "python.uv" = uv.devShells.${system}.default;
        };
      in {
        devShells = shells;
      }
    );
}
