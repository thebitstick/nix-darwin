{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal Utilities
    android-tools
    fastfetch
    ffmpeg
    git
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

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}