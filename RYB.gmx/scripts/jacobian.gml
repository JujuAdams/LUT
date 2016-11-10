///rgb_to_ryb( red, green, blue )

var _target_r  = argument0;
var _target_g  = argument1;
var _target_b  = argument2;
var _tolerance = argument3*argument3;

var _current_r = 127;
var _current_g = 127;
var _current_b = 127;

while( true ) {
    
    var _guess_r = ryb_to_rgb_red(   _current_r, _current_y, _current_b );
    var _guess_g = ryb_to_rgb_green( _current_r, _current_y, _current_b );
    var _guess_b = ryb_to_rgb_blue(  _current_r, _current_y, _current_b );
    
    var _distance_r = _target_r - _guess_r;
    var _distance_g = _target_g - _guess_g;
    var _distance_b = _target_b - _guess_b;
    
    if ( ( _distance_r*_distance_r + _distance_g*_distance_g + _distance_b*_distance_b ) < _tolerance ) {
        return make_colour_rgb( _guess_r, _guess_g, _guess_b );
    }
    
    var _jacobian;
    _jacobian[0,0] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,    true, false, false );
    _jacobian[1,0] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,    true, false, false );
    _jacobian[2,0] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,    true, false, false );
    
    _jacobian[0,1] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,   false,  true, false );
    _jacobian[1,1] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,   false,  true, false );
    _jacobian[2,1] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,   false,  true, false );
    
    _jacobian[0,2] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,   false, false,  true );
    _jacobian[1,2] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,   false, false,  true );
    _jacobian[2,2] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,   false, false,  true );
    
    _guess_r += _jacobian[0,0]*_distance_r + _jacobian[1,0]*_distance_g + _jacobian[2,0]*_distance_b;
    _guess_g += _jacobian[0,1]*_distance_r + _jacobian[1,1]*_distance_g + _jacobian[2,1]*_distance_b;
    _guess_b += _jacobian[0,2]*_distance_r + _jacobian[1,2]*_distance_g + _jacobian[2,2]*_distance_b;
    
}
