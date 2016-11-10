///tie_rgb_to_ryb()

var _x = rgb_r_obj.value * 255;
var _y = rgb_g_obj.value * 255;
_x += floor( ( rgb_b_obj.value * 256 * 256 ) mod 4096 );
_y += floor( 256 * ( ( rgb_b_obj.value * 256 * 256 ) div 4096 ) );

var _pixel = surface_getpixel( output_obj.srf_ryb, _x, _y );
ryb_r_obj.value = colour_get_red(   _pixel ) / 255;
ryb_y_obj.value = colour_get_green( _pixel ) / 255;
ryb_b_obj.value = colour_get_blue(  _pixel ) / 255;

if ( output_obj.tie_rgb_and_ryb ) { 
    rgb_r_obj.value =   ryb_to_rgb_red( ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
    rgb_g_obj.value = ryb_to_rgb_green( ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
    rgb_b_obj.value =  ryb_to_rgb_blue( ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
    
    with( fader_obj ) x = xstart + value * length;
}

output_obj.colour = make_color_rgb( rgb_r_obj.value * 255, rgb_g_obj.value * 255, rgb_b_obj.value * 255 );

hsv_h_obj.value =        color_get_hue( output_obj.colour ) / 255;
hsv_s_obj.value = color_get_saturation( output_obj.colour ) / 255;
hsv_v_obj.value =      color_get_value( output_obj.colour ) / 255;
