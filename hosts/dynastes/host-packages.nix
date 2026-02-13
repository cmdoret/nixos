{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    feishin
    freecad # computer assisted design
    lutris
    obs-studio
    osu-lazer-bin
    vesktop
  ];
}
