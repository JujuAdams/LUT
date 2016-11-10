attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 v_vWhite;
uniform vec3 v_vYellow;
uniform vec3 v_vRed;
uniform vec3 v_vOrange;
uniform vec3 v_vBlue;
uniform vec3 v_vGreen;
uniform vec3 v_vPurple;
uniform vec3 v_vBlack;

vec3 cerp( float T, vec3 A, vec3 B ) {
    return mix( A, B,  T*T * ( 3.0 - T*2.0 ) );
}

void main() {
    
    vec4 vColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4( cerp( vColour.r, cerp( vColour.g, cerp( vColour.b, v_vWhite , v_vBlue   ),
                                                           cerp( vColour.b, v_vYellow, v_vGreen  ) ),
                                          cerp( vColour.g, cerp( vColour.b, v_vRed   , v_vPurple ),
                                                           cerp( vColour.b, v_vOrange, v_vBlack  ) ) ), 1.0 );
    
}

