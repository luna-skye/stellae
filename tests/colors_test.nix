{ pkgs, helpers }: let
  inherit (pkgs) lib;

  # Validated color codes to test conversion against
  colors = {
    red = {
      hsl = { h = 0;   s = 100; l = 50; };
      rgb = { r = 255; g = 0;   b = 0;  };
      hex = "#FF0000";
    };
    green = {
      hsl = { h = 120; s = 100; l = 50; };
      rgb = { r = 0;   g = 255; b = 0;  };
      hex = "#00FF00";
    };
    blue = {
      hsl = { h = 240; s = 100; l = 50;  };
      rgb = { r = 0;   g = 0;   b = 255; };
      hex = "#0000FF";
    };
    purple = {
      hsl = { h = 300; s = 100; l = 50;  };
      rgb = { r = 255; g = 0;   b = 255; };
      hex = "#FF00FF";
    };
    black = {
      hsl = { h = 0; s = 0; l = 0; };
      rgb = { r = 0; g = 0; b = 0; };
      hex = "#000000";
    };
    grey = {
      hsl = { h = 0;   s = 0;   l = 50;  };
      rgb = { r = 128; g = 128; b = 128; };
      hex = "#808080";
    };
    white = {
      hsl = { h = 0;   s = 0;   l = 100; };
      rgb = { r = 255; g = 255; b = 255; };
      hex = "#FFFFFF";
    };
  };

  conversionFunctions = [
    "hexToRgb" "hexToHsl"
    "rgbToHex" "rgbToHsl"
    "hslToRgb" "hslToHex"
  ];

  generateTests = let
    colorNames = builtins.attrNames colors;

    mkTest = colorName: func: let
      parts = builtins.match "(.+)To(.+)" func;
      from = builtins.elemAt parts 0;
      to = builtins.elemAt parts 1;
      fromAttr = lib.toLower from;
      toAttr = lib.toLower to;
    in {
      name = "test: ${func} (${colorName})";
      value = {
        expr = helpers.colors.${func} colors.${colorName}.${fromAttr};
        expected = if (toAttr == "hex")
          then helpers.colors.cleanHex colors.${colorName}.${toAttr}
          else colors.${colorName}.${toAttr}
          ;
      };
    };

    allTests = builtins.concatLists (
      builtins.map(colorName:
        builtins.map (func: mkTest colorName func) conversionFunctions
      ) colorNames
    );
  in builtins.listToAttrs allTests;

in generateTests
