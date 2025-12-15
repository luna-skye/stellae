{ helpers, ... }: let
  inherit (helpers) hslToHex;

  mkOpts = element: let
    inherit (element) surface accent tokens;
  in {
    background = "#${hslToHex surface.mantle}";
    foreground = "#${hslToHex surface.subtext1}";

    color0  = "#${hslToHex surface.subtext0}";
    color8  = "#${hslToHex surface.overlay0}";
    color7  = "#${hslToHex surface.subtext0}";
    color15 = "#${hslToHex surface.text}";

    color1  = "#${hslToHex accent.red}";
    color9  = "#${hslToHex accent.light_red}";
    color3  = "#${hslToHex accent.yellow}";
    color11 = "#${hslToHex accent.light_yellow}";
    color2  = "#${hslToHex accent.green}";
    color10 = "#${hslToHex accent.light_green}";
    color4  = "#${hslToHex accent.blue}";
    color12 = "#${hslToHex accent.light_blue}";
    color6  = "#${hslToHex accent.purple}";
    color14 = "#${hslToHex accent.light_purple}";
    color5  = "#${hslToHex accent.magenta}";
    color13 = "#${hslToHex accent.light_magenta}";

    mark1_foreground = "#${hslToHex surface.crust}";
    mark1_background = "#${hslToHex accent.light_green}";
    mark2_foreground = "#${hslToHex surface.crust}";
    mark2_background = "#${hslToHex accent.light_yellow}";
    mark3_foreground = "#${hslToHex surface.crust}";
    mark3_background = "#${hslToHex accent.light_red}";

    cursor = "#${hslToHex tokens.primary}";
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
