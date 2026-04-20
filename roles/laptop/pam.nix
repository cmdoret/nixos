# Dynamic PAM configuration to only prompt for fingerprint if laptop lid is open.

{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.laptop.enable {

    # Exit code 1 if laptop is open, 0 if closed
    environment.etc."check-lid-closed" = {
      mode = "0755";
      text = ''
        #!/bin/sh
        for f in /proc/acpi/button/lid/*/state; do
          [ -f "$f" ] || continue
          read -r state < "$f"
          case "$state" in
            *closed*) exit 0 ;;
          esac
        done
        exit 1
      '';
    };

    # insert rule "check-lid" just before fprintd (which has order 11400)
    # that skips (success=1) the next module on success.
    # tl;dr: skip fingerprint when lid is closed
    security.pam.services.greetd.rules.auth = {
      check-lid = {
        order = 11399;
        control = "[success=1 default=ignore]";
        modulePath = "${pkgs.linux-pam}/lib/security/pam_exec.so";
        args = [
          "quiet"
          "/etc/check-lid-closed"
        ];
      };
      fprintd.args = lib.mkForce [ "timeout=10" ];
    };
  };
}
