{pkgs}: [
  {
    packages = with pkgs; [
      wget
      curl
    ];

    languages.r = {
      enable = true;
      radian.enable = true;
      packages = with pkgs.rPackages; [
        tidyverse
        ggplot2
        dplyr
        devtools
      ];
    };

    env = {
      R_LIBS_USER = ".r-local-lib";
    };
  }
]
