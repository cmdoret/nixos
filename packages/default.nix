{ pkgs, inputs ? {} }:
{
  kubectl-encrypted-kubeconfig = pkgs.callPackage ./kubectl-encrypted-kubeconfig { };
  stremio-enhanced = pkgs.callPackage ./stremio-enhanced { };
}
