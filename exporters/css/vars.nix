{ pkgs, helpers, element, ... }:


let
  hsl = c: "hsl(${toString c.h}, ${toString c.s}%, ${toString c.l}%)";

  cssFile = /* css */ ''
  /*
  ${helpers.mkStellaeStamp "CSS Variables" element.name}
  */

  :root {
    --stl-surface-crust:    ${hsl element.surface.crust};
    --stl-surface-mantle:   ${hsl element.surface.mantle};
    --stl-surface-base:     ${hsl element.surface.base};
    --stl-surface-surface0: ${hsl element.surface.surface0};
    --stl-surface-surface1: ${hsl element.surface.surface1};
    --stl-surface-overlay0: ${hsl element.surface.overlay0};
    --stl-surface-overlay1: ${hsl element.surface.overlay1};
    --stl-surface-subtext0: ${hsl element.surface.subtext0};
    --stl-surface-subtext1: ${hsl element.surface.subtext1};
    --stl-surface-text:     ${hsl element.surface.text};

    --stl-accent-red:           ${hsl element.accent.red};
    --stl-accent-light_red:     ${hsl element.accent.light_red};
    --stl-accent-orange:        ${hsl element.accent.orange};
    --stl-accent-light_orange:  ${hsl element.accent.light_orange};
    --stl-accent-yellow:        ${hsl element.accent.yellow};
    --stl-accent-light_yellow:  ${hsl element.accent.light_yellow};
    --stl-accent-green:         ${hsl element.accent.green};
    --stl-accent-light_green:   ${hsl element.accent.light_green};
    --stl-accent-blue:          ${hsl element.accent.blue};
    --stl-accent-light_blue:    ${hsl element.accent.light_blue};
    --stl-accent-purple:        ${hsl element.accent.purple};
    --stl-accent-light_purple:  ${hsl element.accent.light_purple};
    --stl-accent-magenta:       ${hsl element.accent.magenta};
    --stl-accent-light_magenta: ${hsl element.accent.light_magenta};

    --stl-primary: var(--stl-${element.settings.primary.category}-${element.settings.primary.color});
    --stl-secondary: var(--stl-${element.settings.secondary.category}-${element.settings.secondary.color});
  }
  '';
in pkgs.stdenv.mkDerivation {
  name = "css-vars";
  src = ./.;
  buildPhase = ''
    mkdir -p "$out/css"
    echo "${cssFile}" > "$out/css/vars.css"
  '';
}
