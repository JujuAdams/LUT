attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

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
    
    float fRed   = mod( v_vTexcoord.x, 1.0 / 16.0 ) * 16.0;
    float fGreen = mod( v_vTexcoord.y, 1.0 / 16.0 ) * 16.0;
    float fBlue  = ( floor( v_vTexcoord.x * 16.0 ) + floor( v_vTexcoord.y * 16.0 ) * 16.0 ) / 255.0;
    
    gl_FragColor = vec4( cerp( fRed, cerp( fGreen, cerp( fBlue, v_vWhite , v_vBlue   ),
                                                   cerp( fBlue, v_vYellow, v_vGreen  ) ),
                                     cerp( fGreen, cerp( fBlue, v_vRed   , v_vPurple ),
                                                   cerp( fBlue, v_vOrange, v_vBlack  ) ) ), 1.0 );
    
}

