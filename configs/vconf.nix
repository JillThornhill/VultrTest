{ pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
    pkgs.firefox
  ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKI1shQgwbLbzokhGbvMfR8cQYwTJsGgFPCKZDp33K/m chongololo.lodge@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKREKbihvckSohdmjQFZELhNNhSHdaoO9zPUUUCll9Y0 jill@Ubuntu"
  ];
  system.stateVersion = "23.11";
}

