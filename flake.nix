{
  description = "Procedural UI color palette generation with granular controls via Nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
  let
    #  TODO: allow builds on more than linux
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    inherit (pkgs) lib;
    helpers = import ./helpers { inherit pkgs; };

    rawElements = helpers.importSubmodules ./elements;
    elements = builtins.mapAttrs (name: el:
      { inherit name; } //
      (helpers.colors.convertElementTokens el)
    ) rawElements;
    exporters = helpers.buildExporterOutputs ./exporters;

    buildExporterOutputs = dir: element:
      let
        contents = builtins.readDir dir;
        dirs = builtins.filter (name: contents.${name} == "directory") (builtins.attrNames contents);
        nixFiles = builtins.filter (name: builtins.match ".*\\.nix" name != null) (builtins.attrNames contents);
        files = builtins.listToAttrs (map (name: {
          name = builtins.replaceStrings [".nix"] [""] name;
          value = import (dir + "/${name}") { inherit pkgs helpers element; };
        }) nixFiles);
      in
        if dirs == [] then
          files // {
            default = pkgs.symlinkJoin {
              name = "${element.name}-default";
              paths = builtins.attrValues files;
            };
          }
        else
          builtins.listToAttrs (map (name: {
            inherit name;
            value = buildExporterOutputs (dir + "/${name}") element;
          }) dirs);

    dynamicOutputs = builtins.mapAttrs (el: element:
      buildExporterOutputs ./exporters element //

      { default = pkgs.symlinkJoin {
        name = "stellae-${el}-full";
        paths = [];
      }; }
    ) elements;

    # The `default` output builds and symlinks all exporters and themes.
    defaultOutput.default = pkgs.symlinkJoin {
      name = "stellae-full";
      paths = [
        # (pkgs.callPackage ./exporters/css/css-vars.nix { inherit pkgs helpers; element = {}; })

        (pkgs.stdenv.mkDerivation {
          name = "stellae-test";
          src = ./.;
          buildPhase = ''
            mkdir -p $out
            echo "${builtins.toJSON elements}" > $out/test.json
          '';
        })
      ];
    };

  in dynamicOutputs // defaultOutput // {
    tests = import ./tests { inherit pkgs helpers; };
    lib = helpers // {
      elements = {
        "carbon"   = import ./elements/carbon.nix;
        "hydrogen" = import ./elements/hydrogen.nix;
        "plasma"   = import ./elements/plasma.nix;
      };
    };
  };
}
