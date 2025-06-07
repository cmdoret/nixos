{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
