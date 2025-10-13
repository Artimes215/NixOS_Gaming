{ pkgs, config, inputs, lib, ... }:
{
    home.packages = with pkgs; [
        clang
        clang-tools # includes clang-tidy, clang-format, etc.
    ];
}