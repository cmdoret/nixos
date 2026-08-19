{ pkgs, inputs ? {} }:
{
  stremio-enhanced = pkgs.callPackage ./stremio-enhanced { };
}
