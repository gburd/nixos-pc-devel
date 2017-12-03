# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ivan";
  networking.wireless.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "US/New_York";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    curl
    sway                               # Desktop using Wayland
    tree                               # File tree
    vim                                # Text editor
    chromium                           # Browser
    tmux                               # Console multiplexer
    htop                               # System monitor
    ffmpeg
    imagemagick                        # Image manip library

    nix-repl                           # Repl for nix package manager
    python36                           # Python programming language
    rustc                              # Rust programming language
    bc                                 # Basic calculator
    irssi                              # Irc client
    ruby                               # Ruby programming language
    sqlite                             # sqlite database
    unzip                              # .zip file util
    hack-font                          # Monospace developer font
    atom-beta                          # The Atom.io Editor/IDE
    font-awesome-ttf                   # Font awesome TTF font for bar
    transmission                       # Bittorrent Client
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.gburd = {
    isNormalUser = true;
    uid = 1001;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}
