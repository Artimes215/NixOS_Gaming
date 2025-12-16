{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };
}
