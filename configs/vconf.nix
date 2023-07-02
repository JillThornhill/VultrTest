{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
  ];

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = 
    [ 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKI1shQgwbLbzokhGbvMfR8cQYwTJsGgFPCKZDp33K/m chongololo.lodge@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKREKbihvckSohdmjQFZELhNNhSHdaoO9zPUUUCll9Y0 jill@Ubuntu"
];
}

