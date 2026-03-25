{ pkgs, lib, ... }:

let
  pname = "stremio-enhanced";
  version = "1.0.2";

  system = pkgs.stdenv.hostPlatform.system;

  # Darwin uses the zip release
  darwinSrc = pkgs.fetchzip {
    url = "https://github.com/REVENGE977/${pname}/releases/download/v${version}/mac-arm64.zip";
    hash = "sha256-m/dL+UIhiK/6ysQi5ihd48qYekD7xqv06UdgNKq8YcI=";
  };

  # Linux uses the AppImage release
  linuxSrc = pkgs.fetchurl {
    url = "https://github.com/REVENGE977/${pname}/releases/download/v${version}/Stremio.Enhanced-${version}.AppImage";
    hash = "sha256-rnR+d7eFHAPRVOnpVFIpdWjtNfLjIq1f4uy7prLBHzo=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {
    inherit pname version;
    src = linuxSrc;
  };

  # Darwin derivation
  darwinPkg = pkgs.stdenv.mkDerivation {
    inherit pname version;
    src = darwinSrc;
    installPhase = ''
      mkdir -p $out/Applications
      cp -r *.app $out/Applications/
    '';
    meta = with lib; {
      description = "Enhanced Stremio client";
      homepage = "https://github.com/REVENGE977/stremio-enhanced";
      platforms = [ "aarch64-darwin" "x86_64-darwin" ];
    };
  };

  # Linux derivation
  linuxPkg = pkgs.appimageTools.wrapType2 {
    inherit pname version;
    src = linuxSrc;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/stremio-enhanced.desktop -t $out/share/applications/
      install -m 444 -D ${appimageContents}/stremio-enhanced.png -t $out/share/pixmaps/

      # Fix the executable name in the desktop file
      substituteInPlace $out/share/applications/stremio-enhanced.desktop \
        --replace-fail 'Exec=AppRun' 'Exec=${pname}' \
        --replace-fail 'Icon=stremio-enhanced' 'Icon=${pname}'
    '';

    meta = with lib; {
      description = "Enhanced Stremio client";
      homepage = "https://github.com/REVENGE977/stremio-enhanced";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in
if pkgs.stdenv.isDarwin then darwinPkg else linuxPkg
