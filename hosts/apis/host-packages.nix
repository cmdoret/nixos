{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
