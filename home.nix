{ config, pkgs, ... }:

{
  # home.file."".text = '''';
  # home.file."".source = ./file.conf;

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}