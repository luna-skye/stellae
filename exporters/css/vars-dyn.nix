{ pkgs, helpers, element, ... }:


let
  hsl = c: "hsl(${toString c.h}, ${toString c.s}%, ${toString c.l}%)";
  mkSurfaceColor = c: "calc(var(--stl-global-surface-hue_offset) + ${toString c.h}), calc(var(--stl-global-surface-sat_scale) * ${toString c.s}%), calc(var(--stl-global-surface-light_scale) * ${toString c.l}%)";
  mkAccentColor = c: "${toString c.h}, calc(var(--stl-global-accent-sat_scale) * ${toString c.s}%), calc(var(--stl-global-accent-light_scale) * ${toString c.l}%)";

  css = /* css */ ''
  /*
  ${helpers.mkStellaeStamp "CSS Dynamic Variables" element.name}
  */

  :root {
    // Global Controls
    --stl-global-surface-hue_offset:  ${toString element.settings.global.surface.hue_offset};
    --stl-global-surface-sat_scale:   ${toString element.settings.global.surface.sat_scale};
    --stl-global-surface-light_scale: ${toString element.settings.global.surface.light_scale};
    --stl-global-accent-sat_scale:    ${toString element.settings.global.accent.sat_scale};
    --stl-global-accent-light_scale:  ${toString element.settings.global.accent.light_scale};

    // Surface Colors
    --stl-surface-crust:    ${mkSurfaceColor element.settings.granular.surface.crust};
    --stl-surface-mantle:   ${mkSurfaceColor element.settings.granular.surface.mantle};
    --stl-surface-base:     ${mkSurfaceColor element.settings.granular.surface.base};
    --stl-surface-surface0: ${mkSurfaceColor element.settings.granular.surface.surface0};
    --stl-surface-surface1: ${mkSurfaceColor element.settings.granular.surface.surface1};
    --stl-surface-overlay0: ${mkSurfaceColor element.settings.granular.surface.overlay0};
    --stl-surface-overlay1: ${mkSurfaceColor element.settings.granular.surface.overlay1};
    --stl-surface-subtext0: ${mkSurfaceColor element.settings.granular.surface.subtext0};
    --stl-surface-subtext1: ${mkSurfaceColor element.settings.granular.surface.subtext1};
    --stl-surface-text:     ${mkSurfaceColor element.settings.granular.surface.text};

    // Accent Colors
    --stl-accent-red:           ${mkAccentColor element.settings.granular.accent.red};
    --stl-accent-light_red:     ${mkAccentColor element.settings.granular.accent.light_red};
    --stl-accent-orange:        ${mkAccentColor element.settings.granular.accent.orange};
    --stl-accent-light_orange:  ${mkAccentColor element.settings.granular.accent.light_orange};
    --stl-accent-yellow:        ${mkAccentColor element.settings.granular.accent.yellow};
    --stl-accent-light_yellow:  ${mkAccentColor element.settings.granular.accent.light_yellow};
    --stl-accent-green:         ${mkAccentColor element.settings.granular.accent.green};
    --stl-accent-light_green:   ${mkAccentColor element.settings.granular.accent.light_green};
    --stl-accent-blue:          ${mkAccentColor element.settings.granular.accent.blue};
    --stl-accent-light_blue:    ${mkAccentColor element.settings.granular.accent.light_blue};
    --stl-accent-purple:        ${mkAccentColor element.settings.granular.accent.purple};
    --stl-accent-light_purple:  ${mkAccentColor element.settings.granular.accent.light_purple};
    --stl-accent-magenta:       ${mkAccentColor element.settings.granular.accent.magenta};
    --stl-accent-light_magenta: ${mkAccentColor element.settings.granular.accent.light_magenta};
  }
  '';
in pkgs.stdenv.mkDerivation {
  name = "css-vars-dyn";
  src = ./.;
  buildPhase = ''
    mkdir -p "$out/css"
    echo "${css}" >> "$out/css/dyn-vars.css"
  '';
}
