{ pkgs, config, inputs, lib, ... }:
{
  # Programming languages and tools
  home.packages = with pkgs; [
    # IDE
    # vscode

    # C++
    clang
    clang-tools  # Includes clang-tidy, clang-format, etc.
    premake5     # Build system for C++
    gnumake
    cmake

    mesa
    libGL.dev
    libGL
    libGLU
    glfw
    glm

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

  # Visual Studio Code
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      # Icon Themes
      catppuccin.catppuccin-vsc-icons

      # Generalized Formatting & Linting
      editorconfig.editorconfig
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode

      # AI/LLM
      github.copilot
      github.copilot-chat

      # Misc. Tools
      formulahendry.code-runner
      ms-vscode.hexeditor
      github.vscode-pull-request-github

      # Astro
      astro-build.astro-vscode

      # C/C++
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      xaver.clang-format

      # Markdown
      yzhang.markdown-all-in-one

      # Nix
      bbenoist.nix

      # PHP
      xdebug.php-debug
      bmewburn.vscode-intelephense-client

      # Python
      ms-python.python

      # TypeScript/JavaScript
      christian-kohler.npm-intellisense
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "horizon-theme-vscode";
        publisher = "alexandernanberg";
        version = "1.0.1";
        sha256 = "sha256-jdtc/v4aX5wAjcs0bIpL808l4EA3o362u0sgzas27YU=";
      }

      {
        name = "daybreak-theme";
        publisher = "mtdmali";
        version = "1.2.0";
        sha256 = "sha256-w9eqsVqPAWs3fcRcIsceOHbz8QZuS7a1TMpeEfNM1P8=";
      }
      
      {
        name = "multi-cursor-case-preserve";
        publisher = "cardinal90";
        version = "1.0.5";
        sha256 = "sha256-eJafjYDydD8DW83VLH9MPFeDENXBx3el7XvjZqu88Jw=";
      }

      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.21.1";
        sha256 = "sha256-y+drPg0brOGd3YHucUt34s1cHuh/53Qj+QZrJYmUYI4=";
      }

      {
        name = "profiler-php-vscode";
        publisher = "devsense";
        version = "1.62.17969";
        sha256 = "sha256-xgS+3x8L/PT6sB+erEB6wSTdxh8ByfqPOcJYRUz5its=";
      }
    ];
  };

  # Configurations
  programs.java = {
    enable = true;  # Java runtime and tools
  };

  # Set PKG_CONFIG_PATH for OpenGL pkg-config
  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.libGL.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
  };
}