{ lib, ff-ultima }:
{ config, pkgs, ... }:

let
  cfg = config.programs.firefox.ffUltima;

  # Where Firefox profiles live on Linux
  firefoxRoot = cfg.firefoxRoot;

  # Tell module which profile directory to target.
  # Example profile directories: "default-release" or "abcd1234.default-release"
  profileDirAbs = "${config.home.homeDirectory}/${firefoxRoot}/${cfg.profileDir}";

  chromeOut = pkgs.runCommand "ff-ultima-chrome" {} ''
    mkdir -p "$out"
    # Theme expects these in the profile's chrome/ directory
    cp -v "${ff-ultima}/userChrome.css"  "$out/userChrome.css"
    cp -v "${ff-ultima}/userContent.css" "$out/userContent.css"
    cp -rv "${ff-ultima}/theme"          "$out/theme"
  '';
in
{
  options.programs.firefox.ffUltima = {
    enable = lib.mkEnableOption "Install FF-ULTIMA into a Firefox profile chrome/ folder";

    # Defaults to the standard Linux location under ~/.mozilla/firefox/
    firefoxRoot = lib.mkOption {
      type = lib.types.str;
      default = ".mozilla/firefox";
      description = "(Linux default: .mozilla/firefox).";
    };

    profileDir = lib.mkOption {
      type = lib.types.str;
      default = "default-release";
      description = "Firefox profile directory name to install into.";
    };

    seedUserJsOnce = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Copy FF-ULTIMA user.js into the profile once (for first-time setup). Should be removed after set up.";
    };
  };

  config = lib.mkIf cfg.enable {
    # Make sure Firefox actually loads userChrome/userContent
    programs.firefox = {
      enable = true;

      # This writes a managed user.js for this pref only.
      # No dumping the entire user.js managed prefs here, it causes
      # settings to be reset.
      profiles.default = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
      };
    };

    # Put FF-ULTIMA files into the target profile's chrome/ folder
    home.file."${firefoxRoot}/${cfg.profileDir}/chrome".source = chromeOut;

    # Not needed but nice to have: seed FF-ULTIMA's user.js ONCE (Recommended by FF-ULTIMA docs)
    home.activation.ffUltimaSeed = lib.mkIf cfg.seedUserJsOnce (
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [ ! -e "${profileDirAbs}/.ff-ultima-seeded" ]; then
          mkdir -p "${profileDirAbs}"
          cp -v "${ff-ultima}/user.js" "${profileDirAbs}/user.js"
          touch "${profileDirAbs}/.ff-ultima-seeded"
          echo "FF-ULTIMA: seeded user.js into ${profileDirAbs}/user.js"
          echo "FF-ULTIMA: restart Firefox once, then DELETE ${profileDirAbs}/user.js (recommended by FF-ULTIMA docs)."
        fi
      ''
    );
  };
}
