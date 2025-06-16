# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{ unstablePkgs, config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 3;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/"; networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain"; ########################## Networking         #
  ###########################
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 443 ]; # Allow HTTPS traffic
  };

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.displayManager.sddm = { enable = true; };
  services.desktopManager.plasma6.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Enable ASUS services
  services.asusd.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  #Database 
  services.postgresql = {
    enable = true;
    package = unstablePkgs.postgresql;

  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sarun = {
    isNormalUser = true;
    description = "Sarun";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        kdePackages.kate
        #  thunderbird
      ];
  };
  #Nix Options
  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #Allow experimental features for nix command use for features like flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs;
      [
        #hyprland utils pkgs
        waybar
        hypridle
        hyprpaper
        hyprshot
        hyprpicker
        hyprlock

        kitty
        wofi
        fastfetch
        wl-clipboard
        home-manager
        brave
        jdk23 # java runtime
        gcc14 # c c++ runtime
        asusctl # hardware support for my laptop
        vlc

      ] ++ (with unstablePkgs; [ neovim ]); # for latest applications
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Forces Wayland for compatible apps
    };
  };

  fonts.packages = with pkgs; [ nerd-fonts.hack nerd-fonts.caskaydia-cove ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.xserver.videoDrivers = [ "nvidia" ];
  services.openssh.enable = true;
  #Graphic Options
  hardware = {
    graphics = { enable = true; }; # opengl enable
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true; # Required for Wayland
      powerManagement.enable = true; # Helps with power saving
      package =
        config.boot.kernelPackages.nvidiaPackages.stable; # Use stable drivers
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true; # Allows `nvidia-offload` command
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
