{
  host,
  pkgs,
  config,
  username,
  ...
}: {
  environment.systemPackages = [
    pkgs.libnotify
  ];
  services.restic.backups = {
    daily = {
      exclude = [
        "/home/*/.cache"
        "/home/*/.steam"
        "/home/*/Nextcloud"
        "/home/*/.local/share/containers"
      ];
      inhibitsSleep = true;
      initialize = true;
      package = pkgs.restic;
      paths = [
        "/home"
        "/data"
      ];
      pruneOpts = ["--keep-daily=7" "--keep-weekly=4" "--keep-monthly=6"];
      repository = "/mnt/backup/${host}_restic";
      passwordFile = "/etc/nixos/restic-password";
      user = "root";

      timerConfig = {
        OnCalendar = "12:10";
        Persistent = true;
      };

    };
  };

  # based on: https://www.arthurkoziel.com/restic-backups-b2-nixos/
  systemd.services = {
    "restic-backups-daily" = {

      # retry every minute on failure (in case of disconnected network)
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "60s";
      };
      # max 10 retries per hour
      unitConfig = {
        OnFailure = "notify-backup-failed.service";
        OnSuccess = "notify-backup-success.service";
        StartLimitIntervalSec = 3600;
        StartLimitBurst = 10;
      };
    };

    "notify-backup-failed" = {
      enable = true;
      description = "Notify on failed backup";
      serviceConfig = {
        Type = "oneshot";
        User = username;
      };

      # required for notify-send
      environment.DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/${
              toString config.users.users.${username}.uid
            }/bus";

      script = ''
        ${pkgs.libnotify}/bin/notify-send --urgency=critical \
          "Backup failed" \
          "$(journalctl -u restic-backups-daily -n 5 -o cat)"
      '';
    };

    "notify-backup-success" = {
      enable = true;
      description = "Notify on successful backup";
      serviceConfig = {
        Type = "oneshot";
        User = username;
      };
      environment.DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/${
              toString config.users.users.${username}.uid
            }/bus";

    script = ''
      ${pkgs.libnotify}/bin/notify-send --urgency=low \
        "Backup complete" 
    '';
    };
  };
}
