{
  description = ''
    Personal dotfiles for using Hyprland via Caelestia/QuickShell on NixOS.
    Intended to be modular for easy customizability.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    #Needs to be looked at more
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Needs to be rethemed
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix/24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Vesktop is currently being used but the home module will be functional sooner or later
    nixcord.url = "github:kaylorben/nixcord";

    # Currently non-functional until fixed upstream
    # Millennium for steam homebrew packages (theming/plugins)
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";

    # FF-Ultima for firefox theming
    ff-ultima = {
      url = "github:soulhotel/FF-ULTIMA";
      flake = false;
    };
  };

  # outputs = inputs@{ nixpkgs, spicetify-nix, millennium, ff-ultima, ... }:
  # {

  #   nixosConfigurations = {
  #     replicant = nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";
  #       modules = [
  #       {
  #         nixpkgs.overlays = [
  #           millennium.overlays.default
  #         ];


  #         _module.args = { inherit inputs; };
  #       }


  #         {
  #           environment.systemPackages = [
              
  #           ];
  #         }

  #         inputs.home-manager.nixosModules.home-manager
  #         ./hosts/desktop/configuration.nix
  #       ];
  #     };
  #   };
  # };

  outputs = inputs@{ nixpkgs, home-manager, spicetify-nix, millennium, ff-ultima, ... }:
  let
    lib = nixpkgs.lib;
  in
  {
    # Export your HM module so other flakes can import it
    homeManagerModules.ff-ultima =
      import ./home/programs/firefox { inherit lib ff-ultima; };

    nixosConfigurations = {
      replicant = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Your overlay + pass inputs into modules
          ({ ... }: {
            nixpkgs.overlays = [
              millennium.overlays.default
            ];

            _module.args = { inherit inputs; };
          })

          # Other modules
          ({ ... }: {
            environment.systemPackages = [ ];
          })

          home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
        ];
      };
    };
  };



}
