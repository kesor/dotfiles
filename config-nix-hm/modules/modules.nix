let
  modules = [
    ./nix.nix
    ./programs/bash
    ./programs/eza.nix
    ./programs/fonts.nix
    ./services/secret-service/secret-service.nix
    ./services/pipewire
    ./services/xrandr.nix
    ./x11
  ];
in
  modules
