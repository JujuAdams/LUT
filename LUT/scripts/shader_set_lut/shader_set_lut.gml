/// @param sprite
/// @param index
/// @param strength

if ( argument2 > 0 ) {
	
	shader_set( shd_lut );
	shader_set_uniform_f( shader_get_uniform( shd_lut, "mixer" ), min( 1, argument2 ) );
	
	var _sampler = shader_get_sampler_index( shd_lut, "LUT" );
	texture_set_stage( _sampler, sprite_get_texture( argument0, argument1 ) );
	gpu_set_tex_filter_ext( _sampler, false );
	
}