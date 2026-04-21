{
  description = "cmdoret-nixos";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jail-nix.url = "github:MohrJonas/jail.nix";
    nh.url = "github:viperML/nh";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nvf.url = "github:NotAShelf/nvf?ref=refs/tags/v0.8";
    stylix.url = "github:nix-community/stylix/release-25.11";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    lib = nixpkgs.lib;

    hosts = lib.filterAttrs (name: type: type == "directory") (builtins.readDir ./hosts);

    hostConfigs = lib.mapAttrs (hostName: _: let
      vars = import ./hosts/${hostName}/flake-vars.nix;
    in {
      inherit (vars) system profile username;
      inherit hostName;
    }) hosts;

    systems = [ "x86_64-linux" "aarch64-darwin" ];

    myPackages = lib.genAttrs systems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
        import ./packages {
          inherit pkgs;
          inherit inputs;
        }
    );

  in {

    packages = myPackages;

    # Generates one nixos configuration per host in `./hosts`
    nixosConfigurations = lib.mapAttrs (hostName: cfg:
      lib.nixosSystem {
        system = cfg.system;
        specialArgs = {
          inherit inputs;
          host = cfg.hostName;
          profile = cfg.profile;
          username = cfg.username;
        };
        modules = [./profiles/${cfg.profile}];
      }
    ) hostConfigs;
  };
}
