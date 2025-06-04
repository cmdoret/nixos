{
  description = "Master flake for dev shells";

  inputs = {
    ml-cuda.url = "./python/ml-cuda";
    uv.url = "./python/uv";
    r.url = "./r";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    ml-cuda,
    uv,
    r,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells = {
        python = {
          ml-cuda = ml-cuda.devShells.${system}.default;
          uv = uv.devShells.${system}.default;
        };
        r = r.devShells.${system}.default;
      };
    });
}
