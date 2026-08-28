{
  config,
  inputs,
  ...
}: {
  _module.args.unstable = import inputs.nixpkgs-unstable {
    system = config.nixpkgs.hostPlatform.system;
    config = config.nixpkgs.config;
  };
}
