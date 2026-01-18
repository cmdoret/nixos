{
  config, 
  inputs,
  lib,
  options,
  pkgs,
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

    settings = {
      download-buffer-size = 250000000;
      # Enable flakes and new 'nix' command
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Deduplicate and optimize nix store
      auto-optimise-store = true;

      # Add your own username to the trusted list
      trusted-users = [ "@wheel" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Garbage collector
    # note: already handled by nh.clean
    gc = {
      automatic = false;
      dates = "daily";
      options = "--delete-older-than 60d";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
      ];
    };
  };
  # ===========================================================================
}
