{ helpers, ... }: let
  inherit (helpers) hslToHex;

in {
  plaintext = { element }: let
    inherit (element) surface tokens;
  in /* json */ ''
    {
      "name": "STELLAE ${helpers.strings.capitalize element.name}",
      "primary": "#${hslToHex tokens.primary}",
      "primaryText": "#${hslToHex surface.text}",
      "primaryContainer": "#${hslToHex surface.mantle}",
      "secondary": "#${hslToHex tokens.secondary}",
      "surface": "#${hslToHex surface.mantle}",
      "surfaceText": "#${hslToHex surface.subtext0}",
      "surfaceVariant": "#${hslToHex surface.base}",
      "surfaceTint": "#${hslToHex tokens.primary}",
      "background": "#${hslToHex surface.surface0}",
      "backgroundText": "#${hslToHex surface.subtext0}",
      "outline": "#${hslToHex tokens.primary}",
      "surfaceContainer": "#${hslToHex surface.surface0}",
      "surfaceContainerHigh": "#${hslToHex surface.surface1}",
      "surfaceContainerHighest": "#${hslToHex surface.overlay0}",
      "error": "#${hslToHex tokens.error}",
      "warning": "#${hslToHex tokens.warning}",
      "info": "#${hslToHex tokens.info}",
      "matugen_type": "scheme-expressive"
    }
  '';
}
