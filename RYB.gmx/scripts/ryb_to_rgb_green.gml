///ryb_to_rgb_green( red, yellow, blue )

var _r = argument0;
var _y = argument1;
var _b = argument2;

var _x0 = cubic_interpolation( _b, color_get_green( c_magic_white  ), color_get_green( c_magic_blue   ) );
var _x1 = cubic_interpolation( _b, color_get_green( c_magic_yellow ), color_get_green( c_magic_green  ) );
var _x2 = cubic_interpolation( _b, color_get_green( c_magic_red    ), color_get_green( c_magic_purple ) );
var _x3 = cubic_interpolation( _b, color_get_green( c_magic_orange ), color_get_green( c_magic_black  ) );

var _y0 = cubic_interpolation( _y, _x0, _x1 );
var _y1 = cubic_interpolation( _y, _x2, _x3 );

return cubic_interpolation( _r, _y0, _y1 );
