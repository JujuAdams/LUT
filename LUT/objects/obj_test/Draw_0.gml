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