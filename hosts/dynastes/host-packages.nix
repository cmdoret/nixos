{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    feishin
    nodejs
    obs-studio
    vesktop
  ];
}
