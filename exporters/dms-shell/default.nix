{ helpers, ... }: {
  plaintext = { element }: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface tokens;
  in /* json */ ''
    {
      "name": "STELLAE ${helpers.strings.capitalize element.name}",
      "primary": "${tokens.primary}",
      "primaryText": "${surface.text}",
      "primaryContainer": "${surface.mantle}",
      "secondary": "${tokens.secondary}",
      "surface": "${surface.mantle}",
      "surfaceText": "${surface.subtext0}",
      "surfaceVariant": "${surface.base}",
      "surfaceTint": "${tokens.primary}",
      "background": "${surface.mantle}",
      "backgroundText": "${surface.subtext0}",
      "outline": "${tokens.primary}",
      "surfaceContainer": "${surface.mantle}",
      "surfaceContainerHigh": "${surface.base}",
      "surfaceContainerHighest": "${surface.surface0}",
      "error": "${tokens.error}",
      "warning": "${tokens.warning}",
      "info": "${tokens.info}",
      "matugen_type": "scheme-expressive"
    }
  '';
}
