{
  pkgs,
  inputs,
  username,
  ...
}: {
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default; # drop if github:nix-community/nh #323 is fixed
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
      dates = "weekly";
    };
    flake = "/home/${username}/.config/nixos";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
