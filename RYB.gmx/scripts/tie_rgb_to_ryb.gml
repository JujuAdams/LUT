///tie_rgb_to_ryb()

var _ryb = rgb_to_ryb( rgb_r_obj.value*255, rgb_g_obj.value*255, rgb_b_obj.value*255, 0.001 );
if ( !is_undefined( _ryb ) ) {
    
    ryb_r_obj.value = colour_get_red(   _ryb ) / 255;
    ryb_y_obj.value = colour_get_green( _ryb ) / 255;
    ryb_b_obj.value = colour_get_blue(  _ryb ) / 255;
    
    if ( output_obj.tie_rgb_and_ryb ) { 
        rgb_r_obj.value = ryb_to_rgb_red(   ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
        rgb_g_obj.value = ryb_to_rgb_green( ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
        rgb_b_obj.value = ryb_to_rgb_blue(  ryb_r_obj.value, ryb_y_obj.value, ryb_b_obj.value ) / 255;
        
        with( fader_obj ) x = xstart + value * length;
    }
    
    output_obj.colour = make_color_rgb( rgb_r_obj.value * 255, rgb_g_obj.value * 255, rgb_b_obj.value * 255 );
    
    hsv_h_obj.value = color_get_hue(        output_obj.colour ) / 255;
    hsv_s_obj.value = color_get_saturation( output_obj.colour ) / 255;
    hsv_v_obj.value = color_get_value(      output_obj.colour ) / 255;
    
}
