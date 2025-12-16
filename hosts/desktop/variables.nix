{ config, lib, ... }:
{
  config.var = {
    hostname = "replicant";
    username = "yharnam";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # NixOS config directory
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    # Git config
    git = {
      username = "TyPolley";
      email = "polleykia@gmail.com";
    };

    # Locale & Keyboard
    timeZone = "America/Kentucky/Louisville";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
