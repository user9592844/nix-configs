{
  description = "Multi-User and Multi-Host NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      url =
        "git+ssh://git@github.com/user9592844/nix-secrets?shallow=1&ref=main";
      flake = false;
      inputs = { };
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, nixos-cosmic, nix-secrets
    , ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit lib; };
      specialArgs = { inherit inputs outputs configVars configLib nixpkgs; };
    in {
      nixosModules = { inherit (import ./modules/nixos) ; };
      homeManagerModules = { inherit (import ./modules/home-manager) ; };

      packages = forAllSystems (system: nixpkgs.legacyPackages.${system});

      nixosConfigurations = {
        hostname0 = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
            {
              nix.settings = {
                substituters = [ "https://cosmic-cachix.org" ];
                trusted-public-keys = [
                  "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
                ];
              };
            }
            nixos-cosmic.nixosModules.default
            ./hosts/hostname0
          ];
        };
      };
    };
}
