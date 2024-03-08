{ config, pkgs, ... }:

{
  networking = {
    computerName = "Jorge’s Laptop Pro";
    localHostName = "Jorges-Laptop-Pro";
    knownNetworkServices = [
      "Wi-Fi"
      "USB 10/100/1000 LAN"
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      fish
    ];
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "altserver" # Linux only on NixPkgs
      "arc"
      "arduino-ide" # Linux only on NixPkgs
      "bartender" # v5 is not available yet on NixPkgs
      "choosy"
      "cleanshot"
      "clone-hero" # Linux only on NixPkgs
      "deepl"
      "firefox" # Linux only on NixPkgs
      "itsycal"
      "keyboardcleantool"
      "linearmouse"
      "lm-studio"
      "macpass"
      "macs-fan-control"
      "microsoft-auto-update"
      "microsoft-excel"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "microsoft-remote-desktop"
      "microsoft-word"
      "mochi-diffusion"
      "obs" # Linux only on NixPkgs
      "obsidian" # Linux only on NixPkgs
      "prismlauncher" # broken package on NixPkgs, wayland dependency required
      "qlmarkdown"
      "raycast" # regular self-updates means NixPkgs cannot be used
      "reminders-menubar"
      "rewind"
      "sensei"
      "sidequest" # Linux only on NixPkgs
      "syntax-highlight"
      "tailscale" # package on NixPkgs but app not available
      "tetrio" # Linux only on NixPkgs
      "toontown-rewritten"
      "transmission" # broken package on NixPkgs, no app shortcut generated
      "ultimaker-cura" # Linux only on NixPkgs
      "utm" # package on NixPkgs available but has broken Container scheme
    ];

    masApps = {
      # Apple Apps
      "Keynote" = 409183694;
      "GarageBand" = 682658836;
      "Xcode" = 497799835;
      "Pages" = 409201541;
      "Numbers" = 409203825;
      "Apple Configurator" = 1037126344;

      # Third-Party Apps
      "Disk Speed Test" = 425264550;
      "PCalc" = 403504866;
      "DaVinci Resolve" = 571213070;
      "OneDrive" = 823766827;
      "Canva" = 897446215;
      "Speedtest" = 1153157709;
      "WaterMinder" = 1415257369;
      "Mini Metro" = 1047760200;
      "Plash" = 1494023538;
      "VIGIL Client Lite" = 1387350823;
      "MusicBox" = 1614730313;
      "Steam Link" = 1246969117;

      # Safari Extensions
      "StreetPass for Mastodon" = 6446224821;
      "SponsorBlock" = 1573461917;
      "10ten Japanese Reader" = 1573540634;
      "Consent-O-Matic" = 1606897889;
      "Mapper" = 1589391989;
      "Tampermonkey" = 1482490089;
      "Dark Reader for Safari" = 1438243180;
      "Bitwarden" = 1352778147;
      "AdGuard for Safari" = 1440147259;
      "Baking Soda" = 1601151613;
    };

    # non-Homebrew, non-App Store, non-NixPkg apps
    # Immersed
    # Sirsi WorkFlows
  };

  security = {
    pam.enableSudoTouchIdAuth = true;
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Fahrenheit"; # I'm so sorry
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 25;
        KeyRepeat = 5;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        "com.apple.trackpad.scaling" = 0.875;
      };
      ".GlobalPreferences"."com.apple.mouse.scaling" = 0.875;

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        expose-group-by-app = true;
        mineffect = "genie";
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        show-recents = false;
        tilesize = 65;
      };

      finder = {
        AppleShowAllExtensions = true;
        CreateDesktop = true;
        FXPreferredViewStyle = "clmv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = true;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      menuExtraClock.IsAnalog = true;

      spaces = {
        spans-displays = false;
      };

      screencapture = {
        disable-shadow = false;
        location = null;
        type = "png";
      };

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 2;
      };
    };
  };
}
