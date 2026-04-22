{pkgs, ...}: [
  {
    packages = with pkgs; [
      wget
      curl
    ];

    languages.go = {
      enable = true;
      delve.enable = true;
      lsp.enable = true;
      version = "1.26.2";
    };
  }
]
