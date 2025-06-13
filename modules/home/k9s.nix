{...}: {
  programs = {
    k9s.enable = true;
    k9s.settings = {
      k9s = {
        refreshRate = 1;
        apiServerTimeout = "15s";
        maxConnRetry = 5;
        defaultView = "";
        imageScans.enabled = false;
        ui = {
          skin = "skin";
          headless = false;
          logoless = true;
          crumbsless = false;
          splashless = true;
        };
        shellPod = {
          image = "busybox:1.35.0";
          namespace = "default";
        };
        logger = {
          showTime = true;
        };
        thresholds = {
          cpu = {
            critical = 90;
            warn = 70;
          };
          memory = {
            critical = 90;
            warn = 70;
          };
        };
      };
    };
  };
}
