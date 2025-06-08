{pkgs, ...}: {
  programs = {
    firefox.enable = true; # Firefox is not installed by default
    dconf.enable = true;
    seahorse.enable = true;
    hyprland.enable = true; #create desktop file and depedencies if you switch to GUI login MGR
    hyprlock.enable = true; #resolve pam issue https://gitlab.com/Zaney/zaneyos/-/issues/164
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #amfora # Fancy Terminal Browser For Gemini Protocol
    appimage-run # Needed For AppImage Support
    bottom # btop like util
    brightnessctl # For Screen Brightness Control
    chromium
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    direnv # Automatically enter dev environments on cd
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    du-dust # faster better du
    dysk # disk usage util
    eza # Beautiful ls Replacement
    fd # find, but better
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    fzf # fuzzy finder
    gdu # graphical disk usage
    gedit # Simple Graphical Text Editor
    gimp # Great Photo Editor
    glxinfo # Needed for inxi -G GPU info
    gping #graphical ping
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    eog # For Image Viewing
    inkscape # vector image editing
    inxi # CLI System Information Tool
    just # command runner
    keybase # key mgmt + encrypted msg/storage
    keybase-gui
    killall # For Killing All Instances Of Programs
    lazygit # Terminal Based Git GUI
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    logseq # personal knowledge management
    lolcat # Add Colors To Your Terminal Command Output
    loupe # gtk based image viewer
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    mullvad-vpn # VPN client
    mullvad-browser # privacy-hardened browser
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nixfmt-rfc-style # Nix Formatter
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    p7zip # compression utility
    rhythmbox
    ripgrep # Improved Grep
    signal-desktop # messaging
    socat # Needed For Screenshots
    sox # audio support for FFMPEG
    supersonic # audio client for subsonic servers
    tealdeer # tldr command reference
    telegram-desktop # messaging
    trayscale # tailscale gui for vpn
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    uv # python tooling
    v4l-utils # Used For Things Like OBS Virtual Camera
    waypaper # backup wallpaper GUI
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
    zip # compression utility
  ];
}
