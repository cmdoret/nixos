_: {
  virtualisation.docker = {
    enable = true;
    daemon.settings.features.containerd-snapshotter = true;
    daemon.settings.live-restore = false;
  };
}
