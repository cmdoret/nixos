{pkgs, ...}: {
  home.packages = [
    (pkgs.python313.withPackages (ppkgs: [
      ppkgs.numpy
      ppkgs.tldr
      ppkgs.pydantic
    ]))
  ];
}
