{ pkgs, nixgl, ... }:

{
  config = {
    home.sessionVariables = {
      NIX_INDEX_DATABASE = "/nix/nix-index";
      NIXPKGS_ALLOW_UNFREE = 1;
    };

    home.packages = with pkgs; [
      manix
      niv
      nix-bash-completions
      nixd
      nix-top
      nom
      nvd
    ];

    programs.nh.enable = true;

    programs.nix-index.enable = true;

    nix = {
      enable = true;
      package = pkgs.nix;
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };
      gc = {
        automatic = true;
        frequency = "weekly";
      };
    };

    nixGL = {
      packages = nixgl.packages;
      defaultWrapper = "mesa";
      installScripts = [ "mesa" ];
      vulkan.enable = true;
    };

  };
}
