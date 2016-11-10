///ryb_to_rgb_blue_diff( red, yellow, blue, dR, dY, dB )

var _r = argument0;
var _y = argument1;
var _b = argument2;

if ( argument5 ) {
    var _x0 = cubic_interpolation_diff( _b, color_get_blue( c_magic_white  ), color_get_blue( c_magic_blue   ) );
    var _x1 = cubic_interpolation_diff( _b, color_get_blue( c_magic_yellow ), color_get_blue( c_magic_green  ) );
    var _x2 = cubic_interpolation_diff( _b, color_get_blue( c_magic_red    ), color_get_blue( c_magic_purple ) );
    var _x3 = cubic_interpolation_diff( _b, color_get_blue( c_magic_orange ), color_get_blue( c_magic_black  ) );
} else {
    var _x0 = cubic_interpolation( _b, color_get_blue( c_magic_white  ), color_get_blue( c_magic_blue   ) );
    var _x1 = cubic_interpolation( _b, color_get_blue( c_magic_yellow ), color_get_blue( c_magic_green  ) );
    var _x2 = cubic_interpolation( _b, color_get_blue( c_magic_red    ), color_get_blue( c_magic_purple ) );
    var _x3 = cubic_interpolation( _b, color_get_blue( c_magic_orange ), color_get_blue( c_magic_black  ) );
}

if ( argument4 ) {
    var _y0 = cubic_interpolation_diff( _y, _x0, _x1 );
    var _y1 = cubic_interpolation_diff( _y, _x2, _x3 );
} else {
    var _y0 = cubic_interpolation( _y, _x0, _x1 );
    var _y1 = cubic_interpolation( _y, _x2, _x3 );
}

if ( argument3 ) {
    return cubic_interpolation_diff( _r, _y0, _y1 );
} else {
    return cubic_interpolation( _r, _y0, _y1 );
}
