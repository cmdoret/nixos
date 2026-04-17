{...}: {
  imports = [../base.nix];

  drivers.amdgpu.enable = false;
  drivers.nvidia.enable = true;
  drivers.nvidia-prime.enable = false;
  drivers.intel.enable = false;
}
