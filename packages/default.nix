{ pkgs }:
{
  stremio-enhanced = pkgs.callPackage ./stremio-enhanced { };
  antigravity-jail = pkgs.callPackage ./antigravity-jail { };
}
