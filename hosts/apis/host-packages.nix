{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feishin
    freecad # computer assisted design
    kubectl
    nodejs
    obs-studio
    slack
    vesktop # OSS discord client
    webex
    zoom-us
  ];
}
