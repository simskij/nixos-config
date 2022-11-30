{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware = {
    bluetooth = {
      enable = true;
      settings = {
        General = {
	  Enable = "Source,Sink,Media,Socket";
	};
      };
    };
  };

  imports = [ 
    ./hardware-configuration.nix
    ./networking.nix
    ./home/home.nix
  ];

  boot = {
    extraModprobeConfig = "options kvm_amd nested=1";
    kernelModules = [ "vhost_vsock" ];
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  virtualisation = {
    libvirtd.enable = true;
  };

  time.timeZone = "Europe/Stockholm";

  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.utf8";
      LC_IDENTIFICATION = "sv_SE.utf8";
      LC_MEASUREMENT = "sv_SE.utf8";
      LC_MONETARY = "sv_SE.utf8";
      LC_NAME = "sv_SE.utf8";
      LC_NUMERIC = "sv_SE.utf8";
      LC_PAPER = "sv_SE.utf8";
      LC_TELEPHONE = "sv_SE.utf8";
      LC_TIME = "sv_SE.utf8";
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      wayland
      glib
      dracula-theme
      gnome3.adwaita-icon-theme
      vim 
      wget
      tailscale
      ulauncher
      python3
      psmisc
      go
      autoconf
      automake
      qemu
    ];
  };

  services = {
    tailscale.enable = true;
    openssh.enable = true;
    dbus.enable = true;
    xserver = {
      layout = "us";
      xkbVariant = "mac";
      displayManager = {
        gdm = {
	  enable = true;
	  wayland = true;
	};
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      gtkUsePortal = true;
    };
  };

  programs = {
    mtr.enable = true;
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    sway = {
      enable = true;
      wrapperFeatures = { gtk = true; };
      extraPackages = with pkgs; [
        swaylock
	swayidle
	wl-clipboard
	wf-recorder
	mako
	grim
	slurp
	kitty
	wofi
      ];
    };
  };

  system.stateVersion = "22.05"; # Did you read the comment?
}
