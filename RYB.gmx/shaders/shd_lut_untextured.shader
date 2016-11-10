attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec4 v_vColour;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec4 v_vColour;

uniform sampler2D u_tLUT;

void main() {
    
    vec2 vPosition = v_vColour.rg / 16.0;
    vPosition.x += mod( floor( v_vColour.b * 255.0 ), 16.0 ) / 16.0;
    vPosition.y += floor( v_vColour.b * 255.0 ) / 16.0;
    
    gl_FragColor = texture2D( u_tLUT, vPosition );
    
}

