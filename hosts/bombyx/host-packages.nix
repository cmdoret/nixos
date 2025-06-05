{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    nodejs
    obs-studio
    vesktop # OSS discord client
  ];
}
