# Open REPL with this flake loaded
repl:
  nix repl --expr 'builtins.getFlake "'$(pwd)'"'

# Run all library tests through nix-unit
test:
  nix-unit --flake '.#tests'

inspect exporter element:
  nix eval --raw --impure --expr 'let s = builtins.getFlake "'$(pwd)'"; in s.exporters.{{exporter}} { element = s.elements.{{element}}; }'

# Preview a specific element's resulting SVG palette showcase
preview element:
  nix eval --raw --impure --expr 'let s = builtins.getFlake "'$(pwd)'"; in s.exporters.svg.strip { element = s.elements.{{element}}; }' > preview.svg
  xdg-open ./preview.svg
