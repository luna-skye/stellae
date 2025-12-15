{ helpers, ... }: let
  inherit (helpers) hslToHex;

  c = element: let
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
  hmOptions = { element }: c element;
  plaintext = { element }: let
    c = c element;
  in ''
    [urgency_normal]
    background="${c.urgency_normal.background}"
    foreground="${c.urgency_normal.foreground}"
    frame_color="${c.urgency_normal.frame_color}"

    [urgency_low]
    background="${c.urgency_low.background}"
    foreground="${c.urgency_low.foreground}"
    frame_color="${c.urgency_low.frame_color}"

    [urgency_critical]
    background="${c.urgency_critical.background}"
    foreground="${c.urgency_critical.foreground}"
    frame_color="${c.urgency_critical.frame_color}"
  '';
}
