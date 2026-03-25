{ pkgs, lib, ... }:

let
  pname = "antigravity-jail";
  version = "1.0.0";

  system = pkgs.stdenv.hostPlatform.system;

  # Fetch sources
  antigravitySrc = import (builtins.fetchTarball {
    url = "https://github.com/jacopone/antigravity-nix/archive/refs/heads/main.tar.gz";
  }) { inherit pkgs; };

  jailNix = import (builtins.fetchTarball {
    url = "https://github.com/MohrJonas/jail.nix/archive/refs/heads/main.tar.gz";
  }) { inherit pkgs; };

  jail = jailNix.lib.init pkgs;
  cs = jail.combinators;

  antigravity = antigravitySrc.packages.${system}.google-antigravity-no-fhs;

  # Toolset for PATH
  agentEnv = pkgs.buildEnv {
    name = "antigravity-agent-tools";
    paths = with pkgs; [
      bashInteractive
      coreutils
      curl
      direnv
      git
      gnugrep
      gnumake
      gnused
      just
      nix
      which
    ];
  };

  antigravityWrapped = pkgs.writeShellScriptBin "antigravity-wrapped" ''
    ${antigravity}/bin/antigravity --verbose --no-sandbox "$@"
  '';

in pkgs.stdenv.mkDerivation {
  inherit pname version;

  name = "${pname}-${version}";

  # We don’t need buildInputs if jail/writeShellScriptBin already adds necessary tools
  installPhase = ''
    mkdir -p $out/bin
    ln -s ${antigravityWrapped}/bin/antigravity-wrapped $out/bin/antigravity
  '';

  # Use a separate derivation for the sandbox, outside of shell quoting
  antigravityJail = jail "antigravity" "${antigravityWrapped}/bin/antigravity-wrapped" [
    cs.gui
    cs.xwayland
    cs.gpu
    cs.network
    cs.open-urls-in-browser
    (cs.set-env "BROWSER" "browserchannel")
    (cs.dbus {
      talk = [
        "org.freedesktop.DBus"
        "org.freedesktop.Notifications"
        "org.freedesktop.secrets"
        "org.freedesktop.portal.Desktop"
      ];
    })
    (cs.bind-pkg "/usr" agentEnv)
    (cs.add-path "/usr/bin")
    (cs.set-env "SHELL" "/usr/bin/bash")
    (cs.add-runtime "mkdir -p ~/.config/Antigravity ~/.antigravity ~/.gemini")
    (cs.rw-bind (cs.noescape "~/.config/Antigravity") (cs.noescape "~/.config/Antigravity"))
    (cs.rw-bind (cs.noescape "~/.antigravity") (cs.noescape "~/.antigravity"))
    (cs.rw-bind (cs.noescape "~/.gemini") (cs.noescape "~/.gemini"))
    (cs.add-runtime ''
      for arg in "$@"; do
        if [ -e "$arg" ]; then
          full_path=$(readlink -f "$arg")
          RUNTIME_ARGS+=(--bind "$full_path" "$full_path")
          RUNTIME_ARGS+=(--bind /dev/null "$full_path/.env")
        fi
      done
    '')
    (cs.set-env "XDG_CONFIG_HOME" (cs.noescape "~/.config"))
    (cs.set-env "NIXOS_OZONE_WL" "1")
  ];

  meta = with lib; {
    description = "Sandboxed Antigravity editor with proper PATH";
    platforms = [ "x86_64-linux" ];
  };
}
