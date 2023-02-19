# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{

  fileSystems."/" =
    { device = "/dev/mapper/vg00-root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/vda1";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/mapper/vg00-swap"; }
    ];

  boot = {
    initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
    initrd.kernelModules = [ ];
    kernelModules = [ ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "1";
      };
      timeout = 15;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  boot.initrd.luks.devices = {
    crypt-root = {
      device = "/dev/vda2";
      allowDiscards = true;
      preLVM = true;
    };
  };

  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
