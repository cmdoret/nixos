{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    kubectl
    libreoffice
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
