{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in {
  imports = [
    #./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./fastfetch
    ./firefox.nix
    ./fzf.nix
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./k9s.nix
    ./noctalia
    ./nvf.nix
    ./python.nix
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix
    ./swappy.nix
    ./virtmanager.nix
    ./wezterm.nix
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./zsh
    # replaced by noctalia
    #./rofi
    #./swaync.nix
    #waybarChoice
    #./wlogout
  ];
}
