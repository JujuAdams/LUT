/// @param sprite1
/// @param index1
/// @param sprite2
/// @param index2
/// @param mix

if ( argument4 <= 0 ) {
	shader_set_lut( argument0, argument1, 1 );
	exit;
}

if ( argument4 >= 1 ) {
	shader_set_lut( argument2, argument3, 1 );
}

shader_set( shd_lut_mix );
shader_set_uniform_f( shader_get_uniform( shd_lut_mix, "mixer" ), argument4 );

var _sampler = shader_get_sampler_index( shd_lut_mix, "LUT_a" );
texture_set_stage( _sampler, sprite_get_texture( argument0, argument1 ) );
gpu_set_tex_filter_ext( _sampler, false );

var _sampler = shader_get_sampler_index( shd_lut_mix, "LUT_b" );
texture_set_stage( _sampler, sprite_get_texture( argument2, argument3 ) );
gpu_set_tex_filter_ext( _sampler, false );