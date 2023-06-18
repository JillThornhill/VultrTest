# Configuration settings for vultr server

{ config, lib, pkgs, modulesPath, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  # Bootloader.


   boot.loader.grub = {
            enable = true;
            device = [ "/dev/sda" ];
            efiSupport = true;
            efiInstallAsRemovable = true;
            useOSProber = true;
          };

   networking.hostName = "nixos"; # Define your hostname.
   networking.networkmanager.enable = true;

  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
    pkgs.firefox
    nixos-anywhere.packages.x86_64-linux.nixos-anywhere
  ];
  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;


  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKREKbihvckSohdmjQFZELhNNhSHdaoO9zPUUUCll9Y0 jill@Ubuntu" ];
}

