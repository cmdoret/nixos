{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    kubectl
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
