rec {
  global = {
    surface = {
      hue_offset = 300.0;
      sat_scale = 1.0;
      light_scale = 1.0;
    };
    accent = {
      sat_scale = 1.0;
      light_scale = 1.0;
    };
  };

  granular = {
    surface = {
      crust    = { h = 0; s = 38; l = 6; };
      mantle   = { h = 0; s = 34; l = 8; };
      base     = { h = 0; s = 32; l = 12; };
      surface0 = { h = 0; s = 30; l = 18; };
      surface1 = { h = 0; s = 28; l = 29; };
      overlay0 = { h = 0; s = 25; l = 45; };
      overlay1 = { h = 0; s = 26; l = 51; };
      subtext0 = { h = 0; s = 52; l = 69; };
      subtext1 = { h = 0; s = 73; l = 81; };
      text     = { h = 0; s = 89; l = 89; };
    };
    accent = {
      red           = { h = 0;   s = 80; l = 55; };
      light_red     = { h = 0;   s = 90; l = 65; };
      orange        = { h = 30;  s = 100; l = 55; };
      light_orange  = { h = 30;  s = 100; l = 69; };
      yellow        = { h = 50;  s = 100; l = 55; };
      light_yellow  = { h = 55;  s = 90; l = 65; };
      green         = { h = 100; s = 80; l = 50; };
      light_green   = { h = 110; s = 90; l = 68; };
      blue          = { h = 200; s = 90; l = 55; };
      light_blue    = { h = 200; s = 90; l = 65; };
      purple        = { h = 280; s = 90; l = 65; };
      light_purple  = { h = 280; s = 90; l = 75; };
      magenta       = { h = 320; s = 80; l = 65; };
      light_magenta = { h = 320; s = 100; l = 75; };
    };
  };

  primary = {
    category = "accent";
    color = "purple";
  };
  secondary = {
    category = "accent";
    color = "magenta";
  };
}
