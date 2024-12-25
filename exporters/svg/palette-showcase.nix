{ pkgs
, helpers
, element
, options ? {
    boxSize = { w = 24; h = 16; };
    boxPadding = 8;
  }
}:


let
  hex = hex: "#${helpers.colors.hslToHex hex}";

  mkTokenRect = x: y: cat: name: /* html */ ''
  <rect id="${name}" width="${toString options.boxSize.w}" height="${toString options.boxSize.h}" x="${toString (x * options.boxSize.w)}" y="${toString (y * options.boxSize.h)}" fill="${hex element.${cat}.${name}}" />
  '';

  svgWidth = helpers.math.round ((options.boxSize.w * 24) + (options.boxPadding * 2));
  svgHeight = helpers.math.round ((options.boxSize.h * 2) + (options.boxPadding * 2));
  svg = /* html */ ''
    <!--
    ${helpers.mkStellaeStamp "SVG Palette Showcase" element.name}
    -->

    <svg width="${toString svgWidth}" height="${toString svgHeight}" xmlns="http://www.w3.org/2000/svg">
      <g>
        ${mkTokenRect 0 0 "surface" "crust"}
        ${mkTokenRect 1 0 "surface" "mantle"}
        ${mkTokenRect 2 0 "surface" "base"}
        ${mkTokenRect 3 0 "surface" "surface0"}
        ${mkTokenRect 4 0 "surface" "surface1"}
        ${mkTokenRect 5 0 "surface" "overlay0"}
        ${mkTokenRect 6 0 "surface" "overlay1"}
        ${mkTokenRect 7 0 "surface" "subtext0"}
        ${mkTokenRect 8 0 "surface" "subtext1"}
        ${mkTokenRect 9 0 "surface" "text"}

        ${mkTokenRect 10 0 "accent" "red"}
        ${mkTokenRect 11 0 "accent" "light_red"}
        ${mkTokenRect 12 0 "accent" "orange"}
        ${mkTokenRect 13 0 "accent" "light_orange"}
        ${mkTokenRect 14 0 "accent" "yellow"}
        ${mkTokenRect 15 0 "accent" "light_yellow"}
        ${mkTokenRect 16 0 "accent" "green"}
        ${mkTokenRect 17 0 "accent" "light_green"}
        ${mkTokenRect 18 0 "accent" "blue"}
        ${mkTokenRect 19 0 "accent" "light_blue"}
        ${mkTokenRect 20 0 "accent" "purple"}
        ${mkTokenRect 21 0 "accent" "light_purple"}
        ${mkTokenRect 22 0 "accent" "magenta"}
        ${mkTokenRect 23 0 "accent" "light_magenta"}
      </g>
    </svg>
  '';
in pkgs.stdenv.mkDerivation {
  name = "svg-palette-showcase";
  src = ./.;
  buildPhase = ''
    mkdir -p "$out/${element.name}/svg"
    echo '${svg}' > "$out/${element.name}/svg/palette-showcase.svg"
  '';
}
