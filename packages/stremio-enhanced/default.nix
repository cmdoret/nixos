{ pkgs, lib, ... }:

let
  pname = "stremio-enhanced";
  version = "1.0.0";

  system = pkgs.stdenv.hostPlatform.system;

  srcs = {
    aarch64-darwin = {
      url = "https://github.com/REVENGE977/${pname}/releases/download/v${version}/mac-arm64.zip";
      hash = "sha256:342fdcf0ec3c040511edcad538682dec10f94a405d328b3bea43a464298f7003";
    };

    x86_64-linux = {
      url = "https://github.com/REVENGE977/${pname}/releases/download/v${version}/linux-x64.tar.gz";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  };

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    exec = pname;
    icon = pname;
    desktopName = "Stremio Enhanced";
    categories = [ "AudioVideo" "Video" ];
  };

in
pkgs.stdenv.mkDerivation {
  inherit pname version;

  src = pkgs.fetchzip srcs.${system};

  nativeBuildInputs =
    [ pkgs.unzip ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      pkgs.makeWrapper
      pkgs.copyDesktopItems
    ];

  desktopItems = lib.optionals pkgs.stdenv.isLinux [ desktopItem ];

  installPhase = ''
    mkdir -p $out
  ''
  + lib.optionalString pkgs.stdenv.isDarwin ''
    mkdir -p $out/Applications
    cp -r *.app $out/Applications/
  ''
  + lib.optionalString pkgs.stdenv.isLinux ''
    # Install app files
    mkdir -p $out/lib/${pname}
    cp -r * $out/lib/${pname}/

    chmod +x $out/lib/${pname}/stremio-enhanced

    # Wrapper
    mkdir -p $out/bin
    makeWrapper $out/lib/${pname}/stremio-enhanced \
      $out/bin/${pname} \
      --prefix LD_LIBRARY_PATH : $out/lib/${pname}

    # Icon (used by desktopItem)
    if [ -f "$out/lib/${pname}/icon.png" ]; then
      mkdir -p $out/share/pixmaps
      cp $out/lib/${pname}/icon.png $out/share/pixmaps/${pname}.png
    fi
  '';

  meta = with lib; {
    description = "Enhanced Stremio client";
    platforms = builtins.attrNames srcs;
  };
}
