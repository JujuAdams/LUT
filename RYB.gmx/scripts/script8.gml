var rgb_r, rgb_g, rgb_b, ryb_r, ryb_y, ryb_b, colour, dist, temp_dist, red, yellow, blue, yellow_list, blue_list;

        rgb_r = rgb_r_obj.value * 255;
        rgb_g = rgb_g_obj.value * 255;
        rgb_b = rgb_b_obj.value * 255;
        dist = 999999
        
        for( red = 0; red < output_obj.resolution; red++ ) {
            
            yellow_list = ds_list_find_value( output_obj.ryb_matrix_list, red );
            
            for( yellow = 0; yellow < output_obj.resolution; yellow++ ) {
            
                blue_list = ds_list_find_value( yellow_list, yellow );
                
                for( blue = 0; blue < output_obj.resolution; blue++ ) {
                
                    colour = ds_list_find_value( blue_list, blue );
                    
                    temp_dist = sqr( color_get_red( colour ) - rgb_r ) + sqr( color_get_green( colour ) - rgb_g ) + sqr( color_get_blue( colour ) - rgb_b );
                    
                    if ( temp_dist < dist ) {
                        ryb_r = 255 * red    / output_obj.resolution;
                        ryb_y = 255 * yellow / output_obj.resolution;
                        ryb_b = 255 * blue   / output_obj.resolution;
                        dist = temp_dist;
                    }
                    
                }
                
            }
            
        }
        
        
        var ryb_r_new, ryb_y_new, ryb_b_new, red_step, yellow_step, blue_step;
        
        ryb_r_new = 0;
        ryb_y_new = 0;
        ryb_b_new = 0;
        
        for( red = 0; red <= output_obj.rummage_resolution; red++ ) {
        
            red_step = ( red - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
            red_step = max(0, min(255, ryb_r + red_step ) );
            
            for( yellow = 0; yellow <= output_obj.rummage_resolution; yellow++ ) {
            
                yellow_step = ( yellow - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
                yellow_step = max(0, min(255, ryb_y + yellow_step ) );
            
                for( blue = 0; blue <= output_obj.rummage_resolution; blue++ ) {
                
                    blue_step = ( blue - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
                    blue_step = max(0, min(255, ryb_b + blue_step ) );
                    
                    make_colour_ryb( red_step, yellow_step, blue_step );
                    
                    temp_dist = sqr( c_magic_rgb_r - rgb_r ) + sqr( c_magic_rgb_g - rgb_g ) + sqr( c_magic_rgb_b - rgb_b );
                    
                    if ( temp_dist < dist ) {
                    
                        ryb_r_new = (    red - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
                        ryb_y_new = ( yellow - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
                        ryb_b_new = (   blue - output_obj.rummage_resolution/2 ) / ( output_obj.rummage_resolution * output_obj.resolution ) * 255;
                        dist = temp_dist;
                        //show_message( string( ryb_r + red_step ) + "," + string( ryb_y + yellow_step ) + "," + string( ryb_b + blue_step ) );
                        
                    }
                    
                }
                
            }
            
        }
        
        ryb_r_obj.value = max(0, min(255, ryb_r + ryb_r_new ) ) / 255;
        ryb_y_obj.value = max(0, min(255, ryb_y + ryb_y_new ) ) / 255;
        ryb_b_obj.value = max(0, min(255, ryb_b + ryb_b_new ) ) / 255;
        
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
