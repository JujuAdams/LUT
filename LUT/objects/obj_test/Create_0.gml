/*
//Testing script to verify passthrough behaviour
surface = surface_create( 256, 256 );
buffer = buffer_create( 256*256*4, buffer_grow, 1 );

var _error = false;
var _time = current_time;

shader_set_lut( spr_lut_passthrough, 0,   1.0 );

for( var _b = 0; _b <= 255; _b++ ) {
	
	surface_set_target( surface );
	for( var _g = 0; _g <= 255; _g++ ) {
		for( var _r = 0; _r <= 255; _r++ ) {
			draw_sprite_ext( spr_pixel, 0, _r, _g, 1, 1, 0, make_colour_rgb( _r, _g, _b ), 1 );
		}
	}
	surface_reset_target();
	
	buffer_get_surface( buffer, surface, 0, 0, 0 );
	buffer_seek( buffer, buffer_seek_start, 0 );
	
	for( var _g = 0; _g <= 255; _g++ ) {
		for( var _r = 0; _r <= 255; _r++ ) {
	
			var _calc_colour = make_colour_rgb( _r, _g, _b );
			var _surface_colour = buffer_read( buffer, buffer_u32 ) & $FFFFFF;
			
			if ( _calc_colour != _surface_colour ) {
				_error = true;
				show_debug_message( "ERROR:" + string( _r ) + "," + string( _g ) + "," + string( _b ) + "=" + string( colour_get_red( _surface_colour ) ) + "," + string( colour_get_green( _surface_colour ) ) + "," + string( colour_get_blue( _surface_colour ) ) );
			}
	
		}
	}
	show_debug_message( string( current_time - _time ) + ":b=" + string( _b ) + " complete" );
}

shader_reset();

if ( _error ) show_message( "ERROR!" ) else show_message( "No errors c:" );
game_end();
*/