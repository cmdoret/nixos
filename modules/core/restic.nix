{
  host,
  pkgs,
  ...
}: {
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
      timerConfig = {
        OnCalendar = "12:10";
        Persistent = true;
      };
      user = "root";
    };
  };
}
