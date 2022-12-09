{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    rPkgs = with pkgs.rPackages; [
      ggplot2
      viridis
      # dplyr
      # tidyr
    ];
    myR = pkgs.rWrapper.override { packages = rPkgs; };
  in
  {

    packages.${system} = rec {
      default = paper;
      paper = pkgs.stdenv.mkDerivation {
        name = "paper";
        src = ./paper;
        buildInputs = [
          pkgs.texlive.combined.scheme-medium
          pkgs.gnumake
          pkgs.rubber
        ];
        buildPhase = ''
          mkdir -p $out
          make paper
          cp main.pdf $out
        '';
        installPhase = ''
          echo "Skipping installPhase"
        '';
      };
    };

    devShells.${system} = {
      rshell = pkgs.mkShell {
        buildInputs = [
          myR
        ];
      };
    };
  };
}
