output_obj.colour = make_color_hsv( hsv_h_obj.value * 255, hsv_s_obj.value * 255, hsv_v_obj.value * 255 );

rgb_r_obj.value =   color_get_red( output_obj.colour ) / 255;
rgb_g_obj.value = color_get_green( output_obj.colour ) / 255;
rgb_b_obj.value =  color_get_blue( output_obj.colour ) / 255;

tie_rgb_to_ryb();
