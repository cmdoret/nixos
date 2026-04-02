{ pkgs, lib, antigravity-nix, jail-nix, ... }:

let
  pname = "antigravity-jail";
  version = "1.0.0";

  system = pkgs.stdenv.hostPlatform.system;

  jail = jail-nix.lib.init pkgs;
  cs = jail.combinators;

  antigravity = antigravity-nix.packages.${system}.google-antigravity-no-fhs;

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

  # Use a separate derivation for the sandbox, outside of shell quoting
  antigravityJailed = jail "antigravity" "${antigravityWrapped}/bin/antigravity-wrapped" [
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
    (cs.rw-bind "/data/nix/main" "/nix")
    (cs.rw-bind "/data/nix/local" (cs.noescape "~/.local/share/nix"))
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

in pkgs.symlinkJoin {
  name = "${pname}-${version}";
  paths = [ antigravityJailed ];

  postBuild = ''
    # Rename the binary if the jail produces a differently named one
    ln -sf ${antigravityJailed}/bin/antigravity $out/bin/antigravity
  '';


  meta = with lib; {
    description = "Sandboxed Antigravity editor with proper PATH";
    platforms = [ "x86_64-linux" ];
  };
}
