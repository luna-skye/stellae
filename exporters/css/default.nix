{ helpers, ... }: let
  mkTokenVar = prefix: token: "var(--${prefix}-${token.category}-${token.color})";

in {
  vars = { element, prefix ? "stl" }: let
    inherit (element) surface accent params;
    hsl = c: "hsl(${toString c.h}, ${toString c.s}%, ${toString c.l}%)";
  in ''
    /*
    ${helpers.mkStellaeStamp "CSS Variables" (helpers.strings.capitalize element.name)}
    */

    :root {
      --${prefix}-surface-crust:    ${hsl surface.crust};
      --${prefix}-surface-mantle:   ${hsl surface.mantle};
      --${prefix}-surface-base:     ${hsl surface.base};
      --${prefix}-surface-surface0: ${hsl surface.surface0};
      --${prefix}-surface-surface1: ${hsl surface.surface1};
      --${prefix}-surface-overlay0: ${hsl surface.overlay0};
      --${prefix}-surface-overlay1: ${hsl surface.overlay1};
      --${prefix}-surface-subtext0: ${hsl surface.subtext0};
      --${prefix}-surface-subtext1: ${hsl surface.subtext1};
      --${prefix}-surface-text:     ${hsl surface.text};

      --${prefix}-accent-red:           ${hsl accent.red};
      --${prefix}-accent-light_red:     ${hsl accent.light_red};
      --${prefix}-accent-orange:        ${hsl accent.orange};
      --${prefix}-accent-light_orange:  ${hsl accent.light_orange};
      --${prefix}-accent-yellow:        ${hsl accent.yellow};
      --${prefix}-accent-light_yellow:  ${hsl accent.light_yellow};
      --${prefix}-accent-green:         ${hsl accent.green};
      --${prefix}-accent-light_green:   ${hsl accent.light_green};
      --${prefix}-accent-blue:          ${hsl accent.blue};
      --${prefix}-accent-light_blue:    ${hsl accent.light_blue};
      --${prefix}-accent-purple:        ${hsl accent.purple};
      --${prefix}-accent-light_purple:  ${hsl accent.light_purple};
      --${prefix}-accent-magenta:       ${hsl accent.magenta};
      --${prefix}-accent-light_magenta: ${hsl accent.light_magenta};

      --${prefix}-primary:   ${mkTokenVar prefix params.tokens.primary};
      --${prefix}-secondary: ${mkTokenVar prefix params.tokens.secondary};
      --${prefix}-info:      ${mkTokenVar prefix params.tokens.info};
      --${prefix}-success:   ${mkTokenVar prefix params.tokens.success};
      --${prefix}-warning:   ${mkTokenVar prefix params.tokens.warning};
      --${prefix}-error:     ${mkTokenVar prefix params.tokens.error};
    }
  '';

  dynamic-vars = /* css */ { element, prefix ? "stl" }: let
    inherit (element) params;
    mkSurfaceColor = c: "calc(var(--stl-global-surface-hue_offset) + ${toString c.h}), calc(var(--stl-global-surface-sat_scale) * ${toString c.s}%), calc(var(--stl-global-surface-light_scale) * ${toString c.l}%)";
    mkAccentColor = c: "${toString c.h}, calc(var(--stl-global-accent-sat_scale) * ${toString c.s}%), calc(var(--stl-global-accent-light_scale) * ${toString c.l}%)";
  in ''
    /*
    ${helpers.mkStellaeStamp "CSS Dynamic Variables" (helpers.strings.capitalize element.name)}
    */

    :root {
      /* Global Controls */
      --${prefix}-global-surface-hue_offset:  ${toString params.global.surface.hue_offset};
      --${prefix}-global-surface-sat_scale:   ${toString params.global.surface.sat_scale};
      --${prefix}-global-surface-light_scale: ${toString params.global.surface.light_scale};
      --${prefix}-global-accent-sat_scale:    ${toString params.global.accent.sat_scale};
      --${prefix}-global-accent-light_scale:  ${toString params.global.accent.light_scale};

      /* Surface Colors */
      --${prefix}-surface-crust:    ${mkSurfaceColor params.surface.crust};
      --${prefix}-surface-mantle:   ${mkSurfaceColor params.surface.mantle};
      --${prefix}-surface-base:     ${mkSurfaceColor params.surface.base};
      --${prefix}-surface-surface0: ${mkSurfaceColor params.surface.surface0};
      --${prefix}-surface-surface1: ${mkSurfaceColor params.surface.surface1};
      --${prefix}-surface-overlay0: ${mkSurfaceColor params.surface.overlay0};
      --${prefix}-surface-overlay1: ${mkSurfaceColor params.surface.overlay1};
      --${prefix}-surface-subtext0: ${mkSurfaceColor params.surface.subtext0};
      --${prefix}-surface-subtext1: ${mkSurfaceColor params.surface.subtext1};
      --${prefix}-surface-text:     ${mkSurfaceColor params.surface.text};

      /* Accent Colors */
      --${prefix}-accent-red:           ${mkAccentColor params.accent.red};
      --${prefix}-accent-light_red:     ${mkAccentColor params.accent.light_red};
      --${prefix}-accent-orange:        ${mkAccentColor params.accent.orange};
      --${prefix}-accent-light_orange:  ${mkAccentColor params.accent.light_orange};
      --${prefix}-accent-yellow:        ${mkAccentColor params.accent.yellow};
      --${prefix}-accent-light_yellow:  ${mkAccentColor params.accent.light_yellow};
      --${prefix}-accent-green:         ${mkAccentColor params.accent.green};
      --${prefix}-accent-light_green:   ${mkAccentColor params.accent.light_green};
      --${prefix}-accent-blue:          ${mkAccentColor params.accent.blue};
      --${prefix}-accent-light_blue:    ${mkAccentColor params.accent.light_blue};
      --${prefix}-accent-purple:        ${mkAccentColor params.accent.purple};
      --${prefix}-accent-light_purple:  ${mkAccentColor params.accent.light_purple};
      --${prefix}-accent-magenta:       ${mkAccentColor params.accent.magenta};
      --${prefix}-accent-light_magenta: ${mkAccentColor params.accent.light_magenta};

      --${prefix}-primary:   ${mkTokenVar prefix params.tokens.primary};
      --${prefix}-secondary: ${mkTokenVar prefix params.tokens.secondary};
      --${prefix}-info:      ${mkTokenVar prefix params.tokens.info};
      --${prefix}-success:   ${mkTokenVar prefix params.tokens.success};
      --${prefix}-warning:   ${mkTokenVar prefix params.tokens.warning};
      --${prefix}-error:     ${mkTokenVar prefix params.tokens.error};
    }
  '';
}
