{ pkgs, helpers }: {
  "test: abs (-20)" = {
    expr = helpers.math.abs (-20);
    expected = 20;
  };

  "test: round" = {
    expr = helpers.math.round 12.2;
    expected = 12.0;
  };


  # CLAMPING
  # positive min clamping
  "test: clamp (4, 8, 2)" = {
    expr = helpers.math.clamp 4 8 2;
    expected = 4;
  };

  # positive max clamping
  "test: clamp (0, 1, 20)" = {
    expr = helpers.math.clamp 0 1 20;
    expected = 1;
  };

  # negative min clamping
  "test: clamp (-1, 1, 20)" = {
    expr = helpers.math.clamp (-1) 1 (-20);
    expected = (-1);
  };

  # negative max clamping
  "test: clamp (-100, -10, 20)" = {
    expr = helpers.math.clamp (-100) (-10) (20);
    expected = (-10);
  };
}
