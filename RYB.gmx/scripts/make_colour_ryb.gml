// arg0 = red
// arg1 = yellow
// arg2 = blue

globalvar c_magic_rgb_r, c_magic_rgb_g, c_magic_rgb_b, c_magic_rgb;

var red    = argument0 / 255;
var yellow = argument1 / 255;
var blue   = argument2 / 255;

c_magic_rgb_r =   ryb_to_rgb_red( red, yellow, blue );
c_magic_rgb_g = ryb_to_rgb_green( red, yellow, blue );
c_magic_rgb_b =  ryb_to_rgb_blue( red, yellow, blue );

c_magic_rgb = make_color_rgb( c_magic_rgb_r, c_magic_rgb_g, c_magic_rgb_b );

return c_magic_rgb;
