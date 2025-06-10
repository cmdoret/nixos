{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    kubectl
    k9s
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
