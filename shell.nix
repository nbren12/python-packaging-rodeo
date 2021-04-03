with import <nixpkgs> { };
let
  python =  python3.withPackages (ps: with ps; [cartopy tensorflow_2]);
in
mkShell {
  buildInputs = [python];
}