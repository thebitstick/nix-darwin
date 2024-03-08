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

    # macOS Background Apps
    alt-tab-macos
    apparency
    keka
    mountain-duck
    swiftbar

    # macOS Graphical Apps
    audacity
    discord
    grandperspective
    iina
    iterm2
    net-news-wire
    openscad
    vscodium
  ];

  programs.git = {
    enable = true;
    userName = "TheBitStick";
    userEmail = "the@bitstick.rip";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
