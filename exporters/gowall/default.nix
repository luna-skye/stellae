{ helpers, lib, ... }: {
  jsonFile = { element }: let
    hexElement = helpers.elementToFormattedHex element;
    inherit (hexElement) surface accent;
  in /* json */ ''
  {
    "name": "stellae-${element.name}",
    "colors": [
      "${surface.crust}"
      "${surface.mantle}"
      "${surface.base}"
      "${surface.surface0}"
      "${surface.surface1}"
      "${surface.overlay0}"
      "${surface.overlay1}"
      "${surface.subtext0}"
      "${surface.subtext1}"
      "${surface.text}"
      "${accent.red}"
      "${accent.light_red}"
      "${accent.orange}"
      "${accent.light_orange}"
      "${accent.yellow}"
      "${accent.light_yellow}"
      "${accent.green}"
      "${accent.light_green}"
      "${accent.blue}"
      "${accent.light_blue}"
      "${accent.purple}"
      "${accent.light_purple}"
      "${accent.magenta}"
      "${accent.light_magenta}"
    ]
  }
  '';
  plaintext = { elements }: let
    mkElementCfg = element: let
      hexElement = helpers.elementToFormattedHex element;
      inherit (hexElement) surface accent;
    in ''
      - name: "STELLAE ${helpers.strings.capitalize element.name}"
        colors:
          - "${surface.crust}"
          - "${surface.mantle}"
          - "${surface.base}"
          - "${surface.surface0}"
          - "${surface.surface1}"
          - "${surface.overlay0}"
          - "${surface.overlay1}"
          - "${surface.subtext0}"
          - "${surface.subtext1}"
          - "${surface.text}"
          - "${accent.red}"
          - "${accent.light_red}"
          - "${accent.orange}"
          - "${accent.light_orange}"
          - "${accent.yellow}"
          - "${accent.light_yellow}"
          - "${accent.green}"
          - "${accent.light_green}"
          - "${accent.blue}"
          - "${accent.light_blue}"
          - "${accent.purple}"
          - "${accent.light_purple}"
          - "${accent.magenta}"
          - "${accent.light_magenta}"
    '';
  in ''
    ${helpers.strings.indent 2 (
      lib.concatStringsSep "\n\n" (
        lib.mapAttrsToList (_: element: "${mkElementCfg element}") elements
      )
    )}
  '';
}
