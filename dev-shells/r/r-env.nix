{pkgs}: [
  {
    packages = with pkgs; [
      wget
      curl
    ];

    languages.r = {
      enable = true;
      radian.enable = true;
    };

    env = {
      R_LIBS_USER = ".r-local-lib";
    };
  }
]
