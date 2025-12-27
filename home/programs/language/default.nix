{ config, pkgs, ... }:

{
    i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-hangul
        fcitx5-gtk
        fcitx5-configtool
    ];
    };


#   home.packages = with pkgs; [
#     # optional, but handy for setup
#     fcitx5
#   ];
}
