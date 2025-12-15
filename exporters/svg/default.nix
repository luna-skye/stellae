{ helpers, ... }: {
  strip = import ./palette-strip.nix { inherit helpers; };
  showcase = import ./palette-showcase.nix { inherit helpers; };
}
