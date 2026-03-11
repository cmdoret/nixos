{ config, lib, pkgs, inputs, ... }:
let
  system = pkgs.system;

  upstream =
    inputs.antigravity-nix.packages.${system}.google-antigravity-no-fhs;

  # Provides minimal set of command line tools for antigravity to use.
  minimalBin = pkgs.symlinkJoin {
      name = "antigravity-tools";
      paths = with pkgs; [
        coreutils
        bash
        gnugrep
        gnused
        findutils
        which
        procps
        util-linux
      ];
  };
  
  # Sandbox bind mounts are dynamically generated based on runtime arguments .
  sandboxWrapper = pkgs.writeShellScriptBin "antigravity-sandboxed" ''
    set -euo pipefail

    binds=""
    args=()

    for arg in "$@"; do
      if [ -e "$arg" ]; then
        abs="$(realpath "$arg")"

        if [ -d "$abs" ]; then
          binds="$binds --bind $abs $abs"
        else
          dir="$(dirname "$abs")"
          binds="$binds --bind $dir $dir"
        fi

        args+=("$abs")
      else
        args+=("$arg")
      fi
    done

    if [ "''${#args[@]}" -eq 0 ]; then
      pwd_dir="$(pwd)"
      binds="$binds --bind $pwd_dir $pwd_dir"
      args+=("$pwd_dir")
    fi

    exec ${pkgs.bubblewrap}/bin/bwrap \
      --die-with-parent \
      --share-net \
      --new-session \
      --dev /dev \
      --proc /proc \
      --tmpfs /tmp \
      --ro-bind /tmp/.X11-unix /tmp/.X11-unix \
      --tmpfs /dev/shm \
      --ro-bind /etc/resolv.conf /etc/resolv.conf \
      --ro-bind /etc/ssl /etc/ssl \
      --ro-bind /nix/store /nix/store \
      --ro-bind ${minimalBin}/bin /usr/bin \
      --ro-bind /etc/fonts /etc/fonts \
      --ro-bind /sys/dev /sys/dev \
      --ro-bind /sys/devices /sys/devices \
      --ro-bind /run/current-system/sw /run/current-system/sw \
      --setenv FONTCONFIG_PATH "/etc/fonts" \
      --symlink /usr/bin /bin \
      --bind "$HOME/.config/Antigravity" "$HOME/.config/Antigravity" \
      --bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
      --setenv DISPLAY ":0" \
      --setenv WAYLAND_DISPLAY "wayland-1" \
      --setenv XDG_RUNTIME_DIR "/run/user/1000" \
      --setenv PATH "/usr/bin" \
      $binds \
      ${upstream}/bin/antigravity "''${args[@]}"
  '';

  wrapped =
    pkgs.symlinkJoin {
      name = "antigravity-sandboxed";
      paths = [ upstream sandboxWrapper ];
    };

in
{

  environment.systemPackages = [
    wrapped
  ];

}
