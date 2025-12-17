{ helpers, ... }: let
  inherit (helpers) toHex;

  mkOpts = element: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface tokens;
  in {
    background-color = "${surface.crust}${toHex 230}";
    text-color = surface.subtext0;
    selection-color = tokens.primary;
  };

in {
  hmOptions = { element }: mkOpts element;
  plaintext = { element }: let
    opts = mkOpts element;
  in ''
    background-color=${opts.background-color}
    text-color=${opts.text-color}
    selection-color=${opts.selection-color}
  '';
}
