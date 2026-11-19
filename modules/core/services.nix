_: {
  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    tailscale = {
      # tailscale vpn
      enable = true;
      useRoutingFeatures = "client";
    };
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = false; # gpg-agent already starts an SSH agent
    smartd = {
      enable = true;
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
