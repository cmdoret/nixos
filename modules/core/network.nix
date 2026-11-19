{
  pkgs,
  host,
  options,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager = {
      enable = true;
      plugins = [ pkgs.networkmanager-openconnect ];
    };
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    # No inbound ports: nothing here serves them. Modules that need one
    # (steam remotePlay, avahi) open it themselves.
    firewall.enable = true;
  };

  environment.systemPackages = with pkgs; [networkmanagerapplet];
}
