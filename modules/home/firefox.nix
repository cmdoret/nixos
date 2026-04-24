{...}: {
  stylix.targets.firefox = {
    profileNames = [
      "clean-profile"
      "cmdoret"
    ];
    colorTheme.enable = true;
  };
  programs.firefox = {
    enable = true;
    profiles = {
      clean-profile = {
        extensions.force = true;
        containersForce = true;
        id = 0;
        isDefault = false;
        name = "clean profile";
      };
      cmdoret = {
        id = 1;
        isDefault = true;
        name = "cmdoret";
        extensions.force = true;
        containersForce = true;
        settings = {
          "browser.startup.homepage" = "https://kagi.com";
        };
        containers = {
          base = {
            color = "blue";
            icon = "circle";
            id = 1;
          };
          shopping = {
            color = "red";
            icon = "cart";
            id = 2;
          };
          work = {
            color = "yellow";
            icon = "briefcase";
            id = 3;
          };
        };
      };
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
