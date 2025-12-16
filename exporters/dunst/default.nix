{ helpers, ... }: let
  inherit (helpers) hslToHex;

  mkOpts = element: let
    inherit (element) surface accent tokens;
  in {
    urgency_normal = {
      background = "#${hslToHex surface.mantle}";
      foreground = "#${hslToHex tokens.primary}";
      frame_color = "#${hslToHex tokens.primary}";
    };
    urgency_low = {
      background = "#${hslToHex surface.mantle}";
      foreground = "#${hslToHex surface.subtext0}";
      frame_color = "#${hslToHex surface.surface1}";
    };
    urgency_critical = {
      background = "#${hslToHex surface.mantle}";
      foreground = "#${hslToHex accent.light_red}";
      frame_color = "#${hslToHex accent.light_red}";
    };
  };

in {
  hmOptions = { element }: mkOpts element;
  plaintext = { element }: let
    opts = mkOpts element;
  in ''
    [urgency_normal]
    background="${opts.urgency_normal.background}"
    foreground="${opts.urgency_normal.foreground}"
    frame_color="${opts.urgency_normal.frame_color}"

    [urgency_low]
    background="${opts.urgency_low.background}"
    foreground="${opts.urgency_low.foreground}"
    frame_color="${opts.urgency_low.frame_color}"

    [urgency_critical]
    background="${opts.urgency_critical.background}"
    foreground="${opts.urgency_critical.foreground}"
    frame_color="${opts.urgency_critical.frame_color}"
  '';
}
