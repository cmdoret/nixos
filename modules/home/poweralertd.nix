{pkgs, ...}: {
  services.poweralertd = {
    enable = true;
    extraArgs = [];
  };
}
