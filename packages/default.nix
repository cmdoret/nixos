{ pkgs, inputs ? {} }:
{
  stremio-enhanced = pkgs.callPackage ./stremio-enhanced { };
  antigravity-jail = pkgs.callPackage ./antigravity-jail {
    inherit inputs;
    inherit (inputs) antigravity-nix jail-nix;
  };
}
