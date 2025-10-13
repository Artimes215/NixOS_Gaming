{ pkgs, config, inputs, lib, ... }:
{
  # Programming languages and tools
  home.packages = with pkgs; [
    # IDE
    vscode

    # C++
    clang
    clang-tools  # Includes clang-tidy, clang-format, etc.
    premake5     # Build system for C++

    # JavaScript/TypeScript
    nodejs       # Node.js runtime
    bun          # Bun runtime (faster alternative to Node.js)
    typescript   # TypeScript compiler

    # Python
    python3      # Python 3 with pip

    # PHP
    php          # PHP interpreter

    # Misc Tools
    prettier     # Code formatter for JS/TS/HTML/CSS
  ];

  # Configurations
  programs.java = {
    enable = true;  # Java runtime and tools
  };
}