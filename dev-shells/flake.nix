{
  description = "Master flake for dev shells";

  inputs = {
    uv.url = "./python/uv";
    uv-cuda.url = "./python/uv-cuda";
    r.url = "./r";
    rust.url = "./rust";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    uv-cuda,
    uv,
    r,
    rust,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells = {
        python = {
          uv = uv.devShells.${system}.default;
          uv-cuda = uv-cuda.devShells.${system}.default;
        };
        r = r.devShells.${system}.default;
        rust = rust.devShells.${system}.default;
      };
    });
}
