{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal Utilities
    android-tools
    fastfetch
    ffmpeg
    imagemagick
    nixpkgs-fmt
    scrcpy
    yt-dlp

    # Programming Languages
    bun
    cargo
    crystal
    nushell
    rustc
  ];

  programs.git = {
    enable = true;
    userName = "TheBitStick";
    userEmail = "the@bitstick.rip";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
