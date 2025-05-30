# nixos

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
