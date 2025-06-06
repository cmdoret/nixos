{pkgs}:
pkgs.writeShellScriptBin "web-search" ''
  # check if rofi is already running
  if pidof rofi > /dev/null; then
    pkill rofi
  fi

  declare -A URLS

  URLS=(
    ["🌎 Search"]="https://duckduckgo.com/?q="
    ["❄️ Unstable Packages"]="https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query="
    ["🐱 Github"]="https://github.com/search?q="
    ["🎞️ YouTube"]="https://www.youtube.com/results?search_query="
    ["🦥 Arch Wiki"]="https://wiki.archlinux.org/title/"
    ["🐃 Gentoo Wiki"]="https://wiki.gentoo.org/index.php?title="
  )

  # List for rofi
  gen_list() {
    for i in "''${!URLS[@]}"
    do
      echo "$i"
    done
  }

  main() {
    # Pass the list to rofi
    platform=$( (gen_list) | ${pkgs.rofi-wayland}/bin/rofi -i -dmenu -config ~/.config/rofi/config-long.rasi )

    if [[ -n "$platform" ]]; then
      query=$( (echo ) | ${pkgs.rofi-wayland}/bin/rofi -dmenu -config ~/.config/rofi/config-long.rasi )

      if [[ -n "$query" ]]; then
        url=''${URLS[$platform]}$query
        xdg-open "$url"
      else
        exit
      fi
    else
      exit
    fi
  }

   main

   exit 0
''
