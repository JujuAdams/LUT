///rgb_to_ryb( red, green, blue, tolerance )

var _target_r  = argument0 / 255;
var _target_g  = argument1 / 255;
var _target_b  = argument2 / 255;
var _tolerance = argument3 * argument3;

//show_debug_message( "target=" + string( _target_r ) + "," + string( _target_g ) + "," + string( _target_b ) );

var _current_r = 0.5;
var _current_y = 0.5;
var _current_b = 0.5;

var _iteration = 0;
while( _iteration < 10 ) {
    _iteration++;
    
    //show_debug_message( string( _iteration ) + " current RYB:" + string( _current_r ) + "," + string( _current_y ) + "," + string( _current_b ) );
    
    var _guess_r = ryb_to_rgb_red(   _current_r, _current_y, _current_b )/255;
    var _guess_g = ryb_to_rgb_green( _current_r, _current_y, _current_b )/255;
    var _guess_b = ryb_to_rgb_blue(  _current_r, _current_y, _current_b )/255;
    
    //show_debug_message( string( _iteration ) + ":" + string( _guess_r ) + "," + string( _guess_g ) + "," + string( _guess_b ) );
    
    var _distance_r = _target_r - _guess_r;
    var _distance_g = _target_g - _guess_g;
    var _distance_b = _target_b - _guess_b;
    
    if ( ( _distance_r*_distance_r + _distance_g*_distance_g + _distance_b*_distance_b ) < _tolerance ) break;
    
    var _jacobian;
    _jacobian[0,0] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,    true, false, false )/255;
    _jacobian[1,0] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,    true, false, false )/255;
    _jacobian[2,0] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,    true, false, false )/255;
    
    _jacobian[0,1] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,   false,  true, false )/255;
    _jacobian[1,1] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,   false,  true, false )/255;
    _jacobian[2,1] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,   false,  true, false )/255;
    
    _jacobian[0,2] = ryb_to_rgb_red_diff(   _current_r, _current_y, _current_b,   false, false,  true )/255;
    _jacobian[1,2] = ryb_to_rgb_green_diff( _current_r, _current_y, _current_b,   false, false,  true )/255;
    _jacobian[2,2] = ryb_to_rgb_blue_diff(  _current_r, _current_y, _current_b,   false, false,  true )/255;
    
    _current_r += _jacobian[0,0]*_distance_r + _jacobian[1,0]*_distance_g + _jacobian[2,0]*_distance_b;
    _current_y += _jacobian[0,1]*_distance_r + _jacobian[1,1]*_distance_g + _jacobian[2,1]*_distance_b;
    _current_b += _jacobian[0,2]*_distance_r + _jacobian[1,2]*_distance_g + _jacobian[2,2]*_distance_b;
    
    //show_debug_message( string( _iteration ) + ":" + string( _current_r ) + "," + string( _current_y ) + "," + string( _current_b ) );
    
}

return make_colour_rgb( _current_r*255, _current_y*255, _current_b*255 );
