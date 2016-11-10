///make_colour_ryb( red, yellow, blue )

var _r = argument0 / 255;
var _y = argument1 / 255;
var _b = argument2 / 255;

return make_color_rgb( ryb_to_rgb_red(   _r, _y, _b ),
                       ryb_to_rgb_green( _r, _y, _b ),
                       ryb_to_rgb_blue(  _r, _y, _b ) );
