{pkgs}:
pkgs.writeShellScriptBin "hypr-reload" ''
  # Reloads and disable external monitor if it was disabled before.
  if hyprctl monitors -j | jq -e 'any(.[]; .name == "eDP-1")' >/dev/null; then
    hyprctl reload
  else
    hyprctl reload
    hyprctl keyword monitor "eDP-1, disable"
  fi
''
