{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    obs-studio
    vesktop # OSS discord client
  ];
}
