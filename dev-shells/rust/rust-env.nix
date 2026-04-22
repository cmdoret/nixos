{
  pkgs,
  ...
}: [
  {
    languages.rust = {
      enable = true;
      channel = "nightly";
      components = ["rustc" "cargo" "clippy" "rustfmt" "rust-analyzer"];
    };
  }
]
