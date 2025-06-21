{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    feishin
    lutris
    nodejs
    obs-studio
    osu-lazer-bin
    vesktop
  ];
}
