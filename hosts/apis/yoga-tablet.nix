{
  pkgs,
  lib,
  username,
  ...
}: let
  output = "eDP-1";
in {
  # Enables iio-sensor-proxy and installs iio-hyprland to watch accelerometer.
  programs.iio-hyprland.enable = true;

  # This assumes Home Manager is used as a NixOS module.
  home-manager.users.${username} = {
    config,
    pkgs,
    lib,
    ...
  }: let
    resetRotation = pkgs.writeShellApplication {
      name = "reset-tablet-rotation";

      runtimeInputs = [
        pkgs.hyprland
      ];

      text = ''
        hyprctl --batch \
          "keyword monitor ${output},transform,0 ; \
           keyword input:touchdevice:transform 0 ; \
           keyword input:tablet:transform 0"
      '';
    };

    tabletMode = pkgs.writeShellApplication {
      name = "tablet-mode";

      runtimeInputs = [
        pkgs.systemd
        resetRotation
      ];

      text = ''
        case "''${1:-}" in
          on)
            # Make the current Hyprland IPC environment available
            # to the user systemd manager.
            systemctl --user import-environment \
              HYPRLAND_INSTANCE_SIGNATURE \
              WAYLAND_DISPLAY

            systemctl --user start iio-hyprland.service
            ;;

          off)
            systemctl --user stop iio-hyprland.service

            # When leaving tablet mode, always restore normal
            # laptop orientation.
            reset-tablet-rotation
            ;;

          *)
            echo "usage: tablet-mode {on|off}" >&2
            exit 2
            ;;
        esac
      '';
    };

    # HM 26.05 can generate either Lua or legacy hyprlang depending
    # on home.stateVersion, so support both.
    switchBinds =
      if config.wayland.windowManager.hyprland.configType == "lua"
      then ''
        hl.bind(
            "switch:on:Intel HID switches",
            hl.dsp.exec_cmd("${tabletMode}/bin/tablet-mode on"),
            { locked = true }
        )

        hl.bind(
            "switch:off:Intel HID switches",
            hl.dsp.exec_cmd("${tabletMode}/bin/tablet-mode off"),
            { locked = true }
        )
      ''
      else ''
        bindl = , switch:on:Intel HID switches, exec, ${tabletMode}/bin/tablet-mode on
        bindl = , switch:off:Intel HID switches, exec, ${tabletMode}/bin/tablet-mode off
      '';
  in {
    # Handy for manually testing `tablet-mode on/off`.
    home.packages = [
      tabletMode
    ];

    systemd.user.services.iio-hyprland = {
      Unit = {
        Description = "Automatic screen rotation in tablet mode";
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        Type = "simple";

        ExecStart =
          "${pkgs.iio-hyprland}/bin/iio-hyprland ${output}";

        Restart = "on-failure";
        RestartSec = 1;

        # iio-hyprland invokes hyprctl and jq internally.
        Environment = [
          "PATH=${lib.makeBinPath [
            pkgs.hyprland
            pkgs.jq
          ]}"
        ];
      };
    };

    wayland.windowManager.hyprland.extraConfig =
      lib.mkAfter switchBinds;
  };
}
