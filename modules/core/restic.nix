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
      ];
      inhibitsSleep = true;
      initialize = true;
      package = pkgs.restic;
      paths = [
        "/home"
        "/data"
      ];
      repository = "/mnt/backup/${host}_daily";
      passwordFile = "/etc/nixos/restic-password";
      timerConfig = {
        OnCalendar = "12:10";
        Persistent = true;
      };
      user = "restic";
    };
  };
}
