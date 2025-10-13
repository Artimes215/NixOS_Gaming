{ config, inputs, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        xfce.thunar
        xfce.thunar-archive-plugin
        xfce.tumbler

        gnome-themes-extra
        papirus-icon-theme
    ];

    environment.sessionVariables = {
        GTK_THEME = "Adwaita:dark";  # Use Adwaita's built-in dark theme
    };
}