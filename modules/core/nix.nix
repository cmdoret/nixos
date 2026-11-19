{
  config, 
  inputs,
  lib,
  ...
}: {
  ### Nix Specific Settings ===================================================
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    # Deduplicate the store once a day rather than on every build (slow)
    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      download-buffer-size = 250000000;
      # Enable flakes and new 'nix' command
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-jobs = 6;
      cores = 6;

      # Add your own username to the trusted list
      trusted-users = [ "@wheel" ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-39.8.10"
      "pnpm-10.29.2"
    ];
  };

  # ===========================================================================
}
