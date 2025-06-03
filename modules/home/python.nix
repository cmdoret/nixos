{pkgs, ...}: {
  home.packages = [
    (pkgs.python313.withPackages (ppkgs: [
      ppkgs.matplotlib
      ppkgs.numpy
      ppkgs.pandas
      ppkgs.polars
      ppkgs.pydantic
      ppkgs.pyyaml
      ppkgs.requests
      ppkgs.urllib3
    ]))
  ];
}
