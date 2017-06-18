var _t = 3*( ( current_time/12000 ) mod 1 );

if ( _t < 1 ) {
	shader_set_lut( spr_lut_a, 0,   _t );
} else if ( _t < 2 ) {
	shader_set_lut_mix( spr_lut_a, 0,   spr_lut_b, 0,   _t-1 );
} else {
	shader_set_lut( spr_lut_b, 0,   3-_t );
}

draw_sprite( spr_test, 0, 0, 0 );
shader_reset();

draw_set_colour( $2C2C2C );
draw_circle( _t/3*room_width, room_height, 10, false );
draw_line_width( room_width/3, room_height, room_width/3, room_height-20, 3 );
draw_line_width( room_width*2/3, room_height, room_width*2/3, room_height-20, 3 );