{ pkgs, helpers }:

let
  colors_test = import ./colors_test.nix { inherit pkgs helpers; };
  math_test = import ./math_test.nix { inherit pkgs helpers; };

in {
  colors = colors_test;
  math = math_test;
}
