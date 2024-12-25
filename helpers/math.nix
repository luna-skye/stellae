{ lib, ... }:

{
  # Calculates the modulo of two numbers
  # @param a The dividend
  # @param b The divisor
  # @return The remainder of a divided by b
  mod = a: b: a - b * (builtins.floor (a / b));

  # Clamps a value between a minimum and maximum
  # @param min The lower bound
  # @param max The upper bound
  # @param value The value to clamp
  # @return The clamped value
  clamp = min: max: value:
    if value < min then min
    else if value > max then max
    else value;

  # Calculates the absolute value of a number
  # @param x The input number
  # @return The absolute value of x
  abs = x: if (x < 0) then 0 - x else x;

  # Rounds a number to the nearest integer
  # @param x The number to round
  # @return The rounded integer
  round = x: builtins.floor (x + 0.5);
}
