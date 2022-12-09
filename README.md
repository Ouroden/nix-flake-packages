# mypkgs_example

An example of my Nix expressions


## Import this flake in another flake

For example in the `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    mypkgs_repo.url = "git+https://gitlab.inria.fr/qguillot/mypkgs_example";
  };

  outputs = { self, nixpkgs, mypkgs_repo }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    mypkgs = mypkgs_repo.packages.${system};
  in
  {
    devShells.${system}.chord-shell = pkgs.mkShell {
        buildInputs = [ mypkgs.chord ];
    };
  };
}
```

## Use a template

For the example of the `article` template:

```bash
$ nix flake init -t git+https://gitlab.inria.fr/qguillot/mypkgs_example#article
```

## Use one package defined

For the example of the `chord` package:

```bash
$ nix shell git+https://gitlab.inria.fr/qguillot/mypkgs_example#chord
```

it will enter an new shell environment with the `chord` package available.


## Register this flake

```bash
$ nix registry add mypkgs git+https://gitlab.inria.fr/qguillot/mypkgs_example
```

Check if it is in the list:

```bash
$ nix registry list
```

We can now use it as simply as:

```bash
$ nix flake show mypkgs

$ nix shell mypkgs#chord
```
