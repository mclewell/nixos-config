{
  fileSystems."/" =
    { device = "/dev/mapper/vg00-root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/nvme0n1p1";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/mapper/vg00-swap"; }
    ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    initrd.kernelModules = [ "dm-snapshot" ];
    kernelModules = [ "intel-kvm" ];
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
      device = "/dev/nvme0n1p2";
      allowDiscards = true;
      preLVM = true;
    };
  };

  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
