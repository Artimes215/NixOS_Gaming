{ pkgs, config, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/cursor
        ../../home/system/fish-shell
        ../../home/system/neofetch
        ../../home/system/git
        ../../home/system/development

        # Programs
        ../../home/programs/brave
	    ../../home/programs/caelestia
        ../../home/programs/discord
        ../../home/programs/ghostty
        ../../home/programs/spicetify
        #../../home/programs/firefox         #No home-manager, for themeing and for configurations
        # ../../home/programs/OBS
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Apps
            # brave

            # Utilities
            grc
            zip
            unzip
            tree
            btop
            fish
            neofetch
            gtk3

            # Misc
            cava
            bluez
            ddcutil
            brightnessctl
            imagemagick

            pkg-config

            r2modman

            obs-studio

            #davinci-resolve
            shotcut


            firefox
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };

    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };
}
