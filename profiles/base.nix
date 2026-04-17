{host, ...}: {
  imports = [
    ../hosts/${host}
    ../modules/drivers
    ../modules/core
    ../roles
  ];

  vm.guest-services.enable = false;
}
