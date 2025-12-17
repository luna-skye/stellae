{ helpers, ... }: let
  mkOpts = element: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface accent tokens;
  in {
    background = surface.mantle;
    foreground = surface.subtext1;

    color0  = surface.subtext0;
    color8  = surface.overlay0;
    color7  = surface.subtext0;
    color15 = surface.text;

    color1  = accent.red;
    color9  = accent.light_red;
    color3  = accent.yellow;
    color11 = accent.light_yellow;
    color2  = accent.green;
    color10 = accent.light_green;
    color4  = accent.blue;
    color12 = accent.light_blue;
    color6  = accent.purple;
    color14 = accent.light_purple;
    color5  = accent.magenta;
    color13 = accent.light_magenta;

    mark1_foreground = surface.crust;
    mark1_background = accent.light_green;
    mark2_foreground = surface.crust;
    mark2_background = accent.light_yellow;
    mark3_foreground = surface.crust;
    mark3_background = accent.light_red;

    cursor = tokens.primary;
  };

in {
  hmOptions = { element }: mkOpts element;
  plaintext = { element }: let
    opts = mkOpts element;
  in ''
    background ${opts.background}
    foreground ${opts.foreground}
    color0 ${opts.color0}
    color1 ${opts.color1}
    color2 ${opts.color2}
    color3 ${opts.color3}
    color4 ${opts.color4}
    color5 ${opts.color5}
    color6 ${opts.color6}
    color7 ${opts.color7}
    color8 ${opts.color8}
    color9 ${opts.color9}
    color10 ${opts.color10}
    color11 ${opts.color11}
    color12 ${opts.color12}
    color13 ${opts.color13}
    color14 ${opts.color14}
    color15 ${opts.color15}
    mark1_background ${opts.mark1_background}
    mark1_foreground ${opts.mark1_foreground}
    mark2_background ${opts.mark2_background}
    mark2_foreground ${opts.mark2_foreground}
    mark3_background ${opts.mark3_background}
    mark3_foreground ${opts.mark3_foreground}
  '';
}
