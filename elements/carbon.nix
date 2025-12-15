{
  global = {
    surface = {
      hue_offset = 0.0;
      sat_scale = 1.0;
      light_scale = 1.0;
    };
    accent = {
      sat_scale = 0.4;
      light_scale = 1.0;
    };
  };

  surface = {
    crust    = { h = 0; s = 0; l = 4; };
    mantle   = { h = 0; s = 0; l = 6; };
    base     = { h = 0; s = 0; l = 10; };
    surface0 = { h = 0; s = 0; l = 14; };
    surface1 = { h = 0; s = 0; l = 24; };
    overlay0 = { h = 0; s = 0; l = 40; };
    overlay1 = { h = 0; s = 0; l = 50; };
    subtext0 = { h = 0; s = 0; l = 65; };
    subtext1 = { h = 0; s = 0; l = 80; };
    text     = { h = 0; s = 0; l = 90; };
  };

  accent = {
    red           = { h = 0;   s = 80;  l = 55; };
    light_red     = { h = 0;   s = 90;  l = 65; };
    orange        = { h = 30;  s = 100; l = 55; };
    light_orange  = { h = 30;  s = 100; l = 69; };
    yellow        = { h = 50;  s = 100; l = 55; };
    light_yellow  = { h = 55;  s = 90;  l = 65; };
    green         = { h = 100; s = 80;  l = 50; };
    light_green   = { h = 110; s = 90;  l = 68; };
    blue          = { h = 200; s = 90;  l = 55; };
    light_blue    = { h = 200; s = 90;  l = 65; };
    purple        = { h = 280; s = 90;  l = 65; };
    light_purple  = { h = 280; s = 90;  l = 75; };
    magenta       = { h = 320; s = 80;  l = 65; };
    light_magenta = { h = 320; s = 100; l = 75; };
  };

  tokens = {
    primary   = { category = "surface"; color = "text";         };
    secondary = { category = "surface"; color = "subtext1";     };

    info      = { category = "accent";  color = "light_blue";   };
    success   = { category = "accent";  color = "light_green";  };
    warning   = { category = "accent";  color = "light_yellow"; };
    error     = { category = "accent";  color = "light_red";    };
  };
}
