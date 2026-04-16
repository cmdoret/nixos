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
    #nvf.url = "github:notashelf/nvf";
    nvf.url = "github:NotAShelf/nvf?ref=refs/tags/v0.8";
    stylix.url = "github:danth/stylix/release-25.11";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    host = "elimus";
    profile = "intel";
    username = "root";

    systems = [ "x86_64-linux" "aarch64-darwin" ];
  
    myPackages = nixpkgs.lib.genAttrs systems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
        import ./packages { inherit pkgs; }
    );

  in {

    # Exposing my packages for multiple systems
    packages = myPackages;

    nixosConfigurations = {
      amd = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/amd];
      };
      nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/nvidia];
      };
      nvidia-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/nvidia-laptop];
      };
      intel = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/intel];
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/vm];
      };
    };
  };
}
