{
  description = "Mac Configuration for Jorge's Laptop Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {

      nixpkgs = {
        hostPlatform = "aarch64-darwin";

        config = {
          allowUnfree = true;
        };
      };

      nix = {
        settings = {
          experimental-features = "nix-command flakes repl-flake";
          extra-platforms = [
            "aarch64-darwin"
            "x86_64-darwin"
          ];
        };

        gc = {
          automatic = true;
          interval.Day = 7;
          options = "--delete-older-than 7d";
        };
        package = pkgs.nix;
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
          utm
          vscodium
        ];

        variables = {
          EDITOR = "nvim";
          VISUAL = "codium";
        };
      };

      programs = {
        # Create /etc/zshrc that loads the nix-darwin environment.
        zsh.enable = true; # default shell on macOS 14 Sonoma
        fish.enable = true;
      };

      homebrew = {
        enable = true;
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
        casks = [ # lonnp = Linux only on NixPkgs
          "altserver" # lonnp
          "arc"
          "arduino-ide" # lonnp
          "bartender" # v5 is not available yet on NixPkgs
          "choosy"
          "cleanshot"
          "clone-hero" # lonnp
          "cloudflare-warp" # lonnp
          "deepl"
          "firefox" # lonnp
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
          "obs" # lonnp
          "obsidian" # lonnp
          "prismlauncher" # broken package on NixPkgs, wayland dependency required
          "qlmarkdown"
          "raycast" # regular self-updates means NixPkgs cannot be used
          "rewind"
          "sensei"
          "sidequest" # lonnp
          "syntax-highlight"
          "tailscale" # package on NixPkgs but app not available
          "tetrio" # lonnp
          "toontown-rewritten"
          "transmission" # broken package on NixPkgs, no app shortcut generated
          "ultimaker-cura" # lonnp
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
          "Shell Fish" = 1336634154;
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
      };

      security = {
        pam.enableSudoTouchIdAuth = true;
      };

      system = {
        defaults = {
          NSGlobalDomain = { ApplePressAndHoldEnabled = false; };

          dock = {
            autohide = true;
            autohide-delay = 0.0;
            orientation = "bottom";
            tilesize = 65;
            show-recents = false;
            mru-spaces = false;
            expose-group-by-app = true;
            mineffect = "genie";
          };

          spaces = {
            spans-displays = false;
          };

          screencapture = {
            disable-shadow = false;
            location = null;
            type = "png";
          };

          finder = {
            AppleShowAllExtensions = true;
            QuitMenuItem = true;
            ShowPathbar = true;
            ShowStatusBar = true;
            CreateDesktop = true;
            FXPreferredViewStyle = "clmv";
            FXDefaultSearchScope = "SCcf";
            FXEnableExtensionChangeWarning = false;
            _FXShowPosixPathInTitle = true;
          };

          trackpad = {
            Clicking = true;
            FirstClickThreshold = 2;
          };
        };
      };

      services = {
        nix-daemon.enable = true;
      };

      system = {
        configurationRevision = self.rev or self.dirtyRev or null;
        stateVersion = 4;
      };
    };
  in
  {
    # $ darwin-rebuild build --flake .#Jorges-Laptop-Pro
    darwinConfigurations."Jorges-Laptop-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    darwinPackages = self.darwinConfigurations."Jorges-Laptop-Pro".pkgs;
  };
}
