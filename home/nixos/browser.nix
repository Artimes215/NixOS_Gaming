{ pkgs, ... }: {
    environment.etc."/brave/policies/managed/GroupPolicy.json".source =
        builtins.toPath ../programs/brave/config/policies.json;
}