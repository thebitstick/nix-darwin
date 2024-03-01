{ config, lib, pkgs, ... }:

{
  imports = [
    ./mac.nix
  ];

  networking = {
    hostName = "Jorges-Laptop-Pro";
    dns = [ # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  users.users.thebitstick = {
    home = "/Users/thebitstick";
    shell = pkgs.nushell;
  };

  environment = {
    systemPackages = with pkgs; [
      # Terminal Utilities
      android-tools
      fastfetch
      ffmpeg
      imagemagick
      inetutils
      neovim
      nixpkgs-fmt
      nmap
      scrcpy
      wget
      yt-dlp

      # Terminal Replacement Utilities
      bat
      du-dust
      duf
      eza
      fd

      # Programming Languages
      bun
      cargo
      crystal
      nushell
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "codium";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
  services.nix-daemon.enable = true;
  nix = {
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = "nix-command flakes repl-flake";
    package = pkgs.nix;
  };
  system.stateVersion = 4;
}