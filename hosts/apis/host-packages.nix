{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    inputs.antigravity-nix.packages.x86_64-linux.default
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
