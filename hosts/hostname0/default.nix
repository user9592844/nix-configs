{ lib, configLib, ... }:

{
  imports = [ ./hardware-configuration.nix ] ++ (map configLib.relativeToRoot [
    # Required configurations
    "hosts/common/core"

    # Optional configurations
    # "hosts/common/optional/cosmic-desktop.nix"
    "hosts/common/optional/gnome-desktop.nix"
    "hosts/common/optional/nil.nix"
    "hosts/common/optional/nixfmt.nix"
    "hosts/common/optional/vlc.nix"

    # Create users
    "hosts/common/users/user0"
  ]);

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /mnt
    mount -t btrfs /dev/mapper/nixos /mnt
    btrfs subvolume delete /mnt/root
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
  '';

  environment.etc."machine-id".source = "/nix/persist/etc/machine-id";

  networking = {
    hostName = "hostname0";
    networkmanager.enable = true;
    firewall.checkReversePath = false;
  };

  system.stateVersion = "24.05";
}
