{ lib, ... }: {
  # Capitalize the first character of a string
  capitalize = str: lib.strings.toUpper (lib.substring 0 1 str) + lib.substring 1 (-1) str;

  # Indent a string by a set number of spaces
  indent = n: str: let
    pad = builtins.concatStringsSep "" (builtins.genList (_: " ") n);
  in builtins.concatStringsSep "\n" (map (line: pad + line) (lib.splitString "\n" str));
}
