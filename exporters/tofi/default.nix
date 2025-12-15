{ helpers, ... }: let
  inherit (helpers) hslToHex toHex;

  mkOpts = element: let
    inherit (element) surface tokens;
  in {
    background-color = "#${hslToHex surface.crust}${toHex 230}";
    text-color = "#${hslToHex surface.subtext0}";
    selection-color = "#${hslToHex tokens.primary}";
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
