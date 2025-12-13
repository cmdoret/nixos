{profile, ...}: {
  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    openssh.enable = false; # Enable SSH
    tailscale = {
      # tailscale vpn
      enable = true;
      useRoutingFeatures = "client";
    };
    blueman.enable = true; # Bluetooth Support
    keybase.enable = true;
    kbfs.enable = true;
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;

    smartd = {
      enable =
        if profile == "vm"
        then false
        else true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
