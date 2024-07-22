{ config, pkgs, ... }:

let
    pkgsUnstable = import <nixpkgs-unstable> {};
in
{
  home.username = "tim";
  home.homeDirectory = "/home/tim";

  home.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;

  # Install packages
  home.packages = [
    pkgs.micromamba
    pkgs.lutris
    pkgs.blender
    pkgs.openboard
    pkgs.fnm
    pkgs.gnome.gnome-boxes
    pkgs.krita
    pkgs.openboard
    pkgs.godot3
    pkgs.prismlauncher

    # Install Nerd Fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })

    # # You can also create simple shell scripts directly
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Manage environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "TimManinger";
    userEmail = "tvm9742@gmail.com";
  };
}
