Home-manager specific stuff
{ config, pkgs, ... }:
# Eventually I will add this to home.nix but it is not needed right now
{
home.packages = with pkgs; [
    r2modman
];
}