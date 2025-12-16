{
  description = "Programmatic, parameterized UI color palette generation via Nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";


  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    helpers = import ./helpers { inherit pkgs; };

    rawElements = helpers.importSubmodules ./elements;
    exporters = helpers.getExporters ./exporters;

  in {
    tests = import ./tests { inherit pkgs helpers; };
    lib = helpers;
    inherit rawElements exporters;
    elements = builtins.mapAttrs (_: raw: helpers.buildElement raw) rawElements;
  };
}
