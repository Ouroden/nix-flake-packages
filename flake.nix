{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system} = rec {
      chord = pkgs.callPackage ./pkgs/chord { };
      chord-docker = pkgs.callPackage ./pkgs/chord/chord_docker.nix { inherit chord; };
    };
    templates = import ./templates/templates.nix;
  };
}
