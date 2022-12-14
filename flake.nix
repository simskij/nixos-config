{
  description = "@simskij's NixOS Configuration Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations = {
        "simme@juniper" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [ ./home/simme ];
        };
      };

      nixosConfigurations = {
        juniper = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hardware/juniper
            ./system
          ];
        };
      };
    };
}
