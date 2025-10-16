{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [
    (import ../../overlays/material-symbols.nix)
  ];

  imports = [
    # System configurations
    ../../home/nixos/boot-manager.nix
    ../../home/nixos/browser.nix
    ../../home/nixos/nvidia.nix
    ../../home/nixos/audio.nix
    ../../home/nixos/bluetooth.nix
    ../../home/nixos/fonts.nix
    ../../home/nixos/home-manager.nix
    ../../home/nixos/nix.nix
    ../../home/nixos/sddm.nix
    ../../home/nixos/users.nix
    ../../home/nixos/utils.nix
    ../../home/nixos/hyprland.nix
    ../../home/nixos/virtualization.nix
    ../../home/nixos/gaming.nix
    ../../home/nixos/thunar.nix

    # Machine-specific hardware configuration
    ./hardware-configuration.nix

    # Host specific variables
    ./variables.nix
  ];

  # Steam installation here since it has linking issues and w/e
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;

      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          
        ];
      };
    };
    gamemode = {
      enable = true;
    };
  };

  # Nix pkg buffer size when downloading
  nix.settings = {
    download-buffer-size = 134217728;
  };

  # Nix PM Version
  nix.package = pkgs.nixVersions.latest;

  # Setup Home Manager for our user
  home-manager.users."${config.var.username}" = import ./home.nix;

  # NixOS Version - Don't Change
  system.stateVersion = "24.11";
}
