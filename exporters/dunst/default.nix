{ helpers, ... }: let
  mkOpts = element: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface accent tokens;
  in {
    urgency_normal = {
      background = surface.mantle;
      foreground = tokens.primary;
      frame_color = tokens.primary;
    };
    urgency_low = {
      background = surface.mantle;
      foreground = surface.subtext0;
      frame_color = surface.surface1;
    };
    urgency_critical = {
      background = surface.mantle;
      foreground = accent.light_red;
      frame_color = accent.light_red;
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
