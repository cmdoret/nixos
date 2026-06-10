{ pkgs, inputs ? {} }:
{
  stremio-enhanced = pkgs.callPackage ./stremio-enhanced { };
  docker-sbx = let
    drv = pkgs.callPackage ./docker-sbx {docker-sbx = drv; };
  in drv;
}
