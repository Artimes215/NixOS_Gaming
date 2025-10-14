{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Kill active window
      "$mod, Q, killactive"

      # Switch to the previous (most recently used) workspace
      "ALT, TAB, workspace, previous"

      # Bindings to open applications
      "$mod, C, exec, uwsm app -- code"         # Open VS Code
      "$mod, SPACE, exec, uwsm app -- ghostty"  # Open Ghostty terminal
      "$mod, B, exec, uwsm app -- brave"        # Open Brave browser

      # Screenshot with hyprshot
      "$mod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh region"
      "$shiftMod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh monitor"

      # Caelestia shell bindings
      "$mod, RETURN, exec, caelestia shell drawers toggle launcher" # Launcher

      "$mod, D, exec, caelestia shell drawers toggle dashboard"
      "$mod, S, exec, caelestia shell drawers toggle session"
    ] ++ ( builtins.concatLists(builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) totalWorkspaces
    ));
  };
}
