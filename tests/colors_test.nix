{ pkgs, helpers }:

let
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
# {
#   # HEX -> RGB
#   "test: HEX -> RGB (red)" = {
#     expr = helpers.colors.hexToRgb colors.red.hex;
#     expected = colors.red.rgb;
#   };
#   "test: HEX -> RGB (green)" = {
#     expr = helpers.colors.hexToRgb colors.green.hex;
#     expected = colors.green.rgb;
#   };
#   "test: HEX -> RGB (blue)" = {
#     expr = helpers.colors.hexToRgb colors.blue.hex;
#     expected = colors.blue.rgb;
#   };
#   "test: HEX -> RGB (purple)" = {
#     expr = helpers.colors.hexToRgb colors.purple.hex;
#     expected = colors.purple.rgb;
#   };
#   "test: HEX -> RGB (black)" = {
#     expr = helpers.colors.hexToRgb colors.black.hex;
#     expected = colors.black.rgb;
#   };
#   "test: HEX -> RGB (grey)" = {
#     expr = helpers.colors.hexToRgb colors.grey.hex;
#     expected = colors.grey.rgb;
#   };
#   "test: HEX -> RGB (white)" = {
#     expr = helpers.colors.hexToRgb colors.white.hex;
#     expected = colors.white.rgb;
#   };
#
#
#   # HEX -> HSL
#   "test: HEX -> HSL (red)" = {
#     expr = helpers.colors.hexToHsl colors.red.hex;
#     expected = colors.red.hsl;
#   };
#   "test: HEX -> HSL (green)" = {
#     expr = helpers.colors.hexToHsl colors.green.hex;
#     expected = colors.green.hsl;
#   };
#   "test: HEX -> HSL (blue)" = {
#     expr = helpers.colors.hexToHsl colors.blue.hex;
#     expected = colors.blue.hsl;
#   };
#   "test: HEX -> HSL (purple)" = {
#     expr = helpers.colors.hexToHsl colors.purple.hex;
#     expected = colors.purple.hsl;
#   };
#   "test: HEX -> HSL (black)" = {
#     expr = helpers.colors.hexToHsl colors.black.hex;
#     expected = colors.black.hsl;
#   };
#   "test: HEX -> HSL (grey)" = {
#     expr = helpers.colors.hexToHsl colors.grey.hex;
#     expected = colors.grey.hsl;
#   };
#   "test: HEX -> HSL (white)" = {
#     expr = helpers.colors.hexToHsl colors.white.hex;
#     expected = colors.white.hsl;
#   };
#
#
#   # RGB -> HSL
#   "test: RGB -> HSL (red)" = {
#     expr = helpers.colors.rgbToHsl colors.red.rgb;
#     expected = colors.red.hsl;
#   };
#   "test: RGB -> HSL (green)" = {
#     expr = helpers.colors.rgbToHsl colors.green.rgb;
#     expected = colors.green.hsl;
#   };
#   "test: RGB -> HSL (blue)" = {
#     expr = helpers.colors.rgbToHsl colors.blue.rgb;
#     expected = colors.blue.hsl;
#   };
#   "test: RGB -> HSL (purple)" = {
#     expr = helpers.colors.rgbToHsl colors.purple.rgb;
#     expected = colors.purple.hsl;
#   };
#   "test: RGB -> HSL (black)" = {
#     expr = helpers.colors.rgbToHsl colors.black.rgb;
#     expected = colors.black.hsl;
#   };
#   "test: RGB -> HSL (grey)" = {
#     expr = helpers.colors.rgbToHsl colors.grey.rgb;
#     expected = colors.grey.hsl;
#   };
#   "test: RGB -> HSL (white)" = {
#     expr = helpers.colors.rgbToHsl colors.white.rgb;
#     expected = colors.white.hsl;
#   };
#
#
#   # HSL -> RGB
#   "test: HSL -> RGB (red)" = {
#     expr = helpers.colors.hslToRgb colors.red.hsl;
#     expected = colors.red.rgb;
#   };
#   "test: HSL -> RGB (green)" = {
#     expr = helpers.colors.hslToRgb colors.green.hsl;
#     expected = colors.green.rgb;
#   };
#   "test: HSL -> RGB (blue)" = {
#     expr = helpers.colors.hslToRgb colors.blue.hsl;
#     expected = colors.blue.rgb;
#   };
#   "test: HSL -> RGB (purple)" = {
#     expr = helpers.colors.hslToRgb colors.purple.hsl;
#     expected = colors.purple.rgb;
#   };
#   "test: HSL -> RGB (black)" = {
#     expr = helpers.colors.hslToRgb colors.black.hsl;
#     expected = colors.black.rgb;
#   };
#   "test: HSL -> RGB (grey)" = {
#     expr = helpers.colors.hslToRgb colors.grey.hsl;
#     expected = colors.grey.rgb;
#   };
#   "test: HSL -> RGB (white)" = {
#     expr = helpers.colors.hslToRgb colors.white.hsl;
#     expected = colors.white.rgb;
#   };
#
#
#   # HSL -> RGB
#   "test: HSL -> HEX (red)" = {
#     expr = helpers.colors.hslToHex colors.red.hsl;
#     expected = helpers.colors.cleanHex colors.red.hex;
#   };
#   "test: HSL -> HEX (green)" = {
#     expr = helpers.colors.hslToHex colors.green.hsl;
#     expected = helpers.colors.cleanHex colors.green.hex;
#   };
#   "test: HSL -> HEX (blue)" = {
#     expr = helpers.colors.hslToHex colors.blue.hsl;
#     expected = helpers.colors.cleanHex colors.blue.hex;
#   };
#   "test: HSL -> HEX (purple)" = {
#     expr = helpers.colors.hslToHex colors.purple.hsl;
#     expected = helpers.colors.cleanHex colors.purple.hex;
#   };
#   "test: HSL -> HEX (black)" = {
#     expr = helpers.colors.hslToHex colors.black.hsl;
#     expected = helpers.colors.cleanHex colors.black.hex;
#   };
#   "test: HSL -> HEX (grey)" = {
#     expr = helpers.colors.hslToHex colors.grey.hsl;
#     expected = helpers.colors.cleanHex colors.grey.hex;
#   };
#   "test: HSL -> HEX (white)" = {
#     expr = helpers.colors.hslToHex colors.white.hsl;
#     expected = helpers.colors.cleanHex colors.white.hex;
#   };
# }
