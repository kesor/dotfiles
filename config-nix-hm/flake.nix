{
  description = "Home Manager configuration of evgeny";

  inputs = {
    # nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    systems.url = "github:nix-systems/default";
    catppuccin.url = "github:catppuccin/nix";
    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs = {
        systems.follows = "systems";
      };
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = {
    nixgl,
    catppuccin,
    nixpkgs,
    homeManager,
    ...
  }@inputs: let
      system = "x86_64-linux";
      customPkgOverlays = f: p: {
        ez-eza = p.callPackage ./derivations/ez-eza.nix {};
        # displaylink = p.callPackage ./derivations/displaylink {};
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay customPkgOverlays ];
        config = {
	  romcSupport = true;
	  allowUnfree = true;
        };
      };
    in {
      homeConfigurations = {
        "evgeny" = homeManager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; inherit nixgl; };
          modules = (import ./modules/modules.nix) ++ [
            ./home.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };
      };
    };
}
