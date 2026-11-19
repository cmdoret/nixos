{pkgs, ...}: {
  # NOTE: xdg.portal is set up by programs.hyprland (system) and home/xdg.nix (user)
  services = {
    flatpak.enable = true; # Enable Flatpak
  };
  #systemd.services.flatpak-repo = {
  #  wantedBy = ["multi-user.target"];
  #  path = [pkgs.flatpak];
  #  script = ''
  #    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #  '';
  #};
}
