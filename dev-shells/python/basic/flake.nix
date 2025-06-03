{
  description = "Basic Python 3.11 development shell with pip/venv support";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        python311
        python311Packages.virtualenv
      ];

      shellHook = ''
        if [ ! -d ".venv" ]; then
          echo "Creating Python virtualenv in .venv..."
          python -m venv .venv
        fi
        echo "Activating virtualenv..."
        source .venv/bin/activate
        echo "✅ Virtualenv ready. Use 'pip install <pkg>' as needed."
      '';
    };
  };
}
