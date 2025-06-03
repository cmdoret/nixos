# nixos

This repository contains the definition of my machines as code (i.e. declarative
setup) using NixOS. It is structured as follows:

- `hosts`: the different machines and their specific configuration values.
- `profiles`: hardware profiles imported by hosts.
- `modules`: software and service configuration.
  - `core`: system packages.
  - `home`: home-manager modules (i.e. nix-based dotfiles).
  - `drivers`: Hardware driver imported by profiles.
- `dev-shells`: ready-to-use development shell for various languages.

This configuration and the setup script are derived from
[zaneyOS](https://gitlab.com/Zaney/zaneyos).

It uses a flake-based nixos config.

## Bootstrap

To set up a new machine, use:

```bash
nix-shell -p git
mkdir -p ~/.config/
cd ~/.config
git clone https://github.com/cmdoret/nixos
cd nixos
bash ./setup.sh
```

## Usage

Helpful aliases to manage the configuration are defined in
`modules/home/zsh/default.nix`:

- `fr`: rebuild the system.
- `ncg`: garbage-collect previous generations.
- `dev`: enter a specific dev-shell by profile name (e.g. `dev python.uv`)
