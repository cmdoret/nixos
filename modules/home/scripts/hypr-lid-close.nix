{pkgs}:
pkgs.writeShellScriptBin "hypr-lid-close" ''
  # Disables laptop monitor on lid close, but
  # only if an external monitor is connected.

  EXTERNAL=$(hyprctl monitors -j | jq -r '.[] | select(.name != "eDP-1")')

  if [[ -n "$EXTERNAL" ]]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
''
