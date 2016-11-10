///scr_lut_x( colour )

return colour_get_red( argument0 ) + ( colour_get_blue( argument0 ) mod 16 ) * 256;
