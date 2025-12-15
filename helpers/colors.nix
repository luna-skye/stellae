{ lib, ... }: let
  math = import ./math.nix { inherit lib; };

in rec {
  # Processes a STELLAE Element and returns the final HSL values of each color
  buildElement = element: let
    inherit (element) global;
    mkColor = cat: color: if (cat == "surface") then {
      h = math.round (math.mod (global.surface.hue_offset + color.h) 360);
      s = math.round (global.surface.sat_scale * color.s);
      l = math.round (global.surface.light_scale * color.l);
    } else {
      h = math.round (math.mod (color.h) 360);
      s = math.round (global.accent.sat_scale * color.s);
      l = math.round (global.accent.light_scale * color.l);
    };
  in rec {
    inherit (element) name;
    params = element;
    surface = builtins.mapAttrs (_: color: mkColor "surface" color) element.surface;
    accent  = builtins.mapAttrs (_: color: mkColor "accent"  color) element.accent;
    tokens  = builtins.mapAttrs (_: token: (
      builtins.getAttr token.color (
        builtins.getAttr token.category { inherit surface accent; }
      )
    )) element.tokens;
  };


  cleanHex = hex: builtins.substring (if (builtins.match "^.*[#].*$" hex) != null then 1 else 0) 6 hex;

  #  FIX: Causes error with high surface saturation levels
  toHex = x: lib.fixedWidthString 2 "0" (lib.toHexString x);

  hueToRgb = { p, q, t }:
    let
      t' = if t < 0 then t + 1 else (if t > 1 then t - 1 else t);
    in
      if t' < 1 / 6 then p + (q - p) * 6 * t'
      else if t' < 1 / 2 then q
      else if t' < 2 / 3 then p + (q - p) * (2 / 3 - t') * 6
      else p;

  hexToRgb = hex: #  
    let
      r = lib.fromHexString (builtins.substring 0 2 (cleanHex hex));
      g = lib.fromHexString (builtins.substring 2 2 (cleanHex hex));
      b = lib.fromHexString (builtins.substring 4 2 (cleanHex hex));
    in builtins.mapAttrs (name: value: math.round value) { inherit r g b; };

  rgbToHsl = rgb:
    let
      r = rgb.r / 255.0;
      g = rgb.g / 255.0;
      b = rgb.b / 255.0;
      cmax = lib.max (lib.max r g) b;
      cmin = lib.min (lib.min r g) b;
      delta = cmax - cmin;
      h = if delta == 0.0 then 0.0
          else if cmax == r then math.mod ((g - b) / delta) 6.0
          else if cmax == g then ((b - r) / delta) + 2.0
          else ((r - g) / delta) + 4.0;
      s = if cmax == 0.0 then 0.0 else delta / cmax;
      l = (cmax + cmin) / 2.0;
    in {
      h = math.mod (h * 60.0) 360.0;
      s = math.round (s * 100.0);
      l = math.round (l * 100.0);
    };

  hslToRgb = { h, s, l }:
    let
      h' = math.mod h 360.0 / 60.0;
      s' = s / 100.0;
      l' = l / 100.0;
      c = (1.0 - math.abs (2.0 * l' - 1.0)) * s';
      x = c * (1.0 - math.abs (math.mod h' 2.0 - 1.0));
      m = l' - c / 2.0;
      r' = if h' < 1.0 then c else if h' < 2.0 then x else if h' < 3.0 then 0.0 else if h' < 4.0 then 0.0 else if h' < 5.0 then x else c;
      g' = if h' < 1.0 then x else if h' < 2.0 then c else if h' < 3.0 then c else if h' < 4.0 then x else if h' < 5.0 then 0.0 else 0.0;
      b' = if h' < 1.0 then 0.0 else if h' < 2.0 then 0.0 else if h' < 3.0 then x else if h' < 4.0 then c else if h' < 5.0 then c else x;
    in {
      r = math.round ((r' + m) * 255.0);
      g = math.round ((g' + m) * 255.0);
      b = math.round ((b' + m) * 255.0);
    };


  rgbToHex = rgb: "${toHex rgb.r}${toHex rgb.g}${toHex rgb.b}";
  hexToHsl = hex: rgbToHsl (hexToRgb hex);
  hslToHex = hsl: rgbToHex (hslToRgb hsl);
}
