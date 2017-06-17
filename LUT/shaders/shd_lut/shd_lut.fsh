const float lut_width = 4096.0;
const float lut_height = 4096.0;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D LUT;
uniform float mixer;

void main() {
	vec4 sample = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float blue = floor( sample.b*255.0 );
	vec2 blue_coord = vec2( mod( blue, 16.0 )/16.0, floor( blue/16.0 )/16.0 );
	vec2 rg_coord = vec2( sample.r*255.0/lut_width, sample.g*255.0/lut_height );
    gl_FragColor = vec4( mix( sample.rgb, texture2D( LUT, blue_coord + rg_coord ).rgb, mixer ), sample.a );
}
