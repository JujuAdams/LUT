///cubic_interpolation_diff( t, a, b )
// arg0 = t
// arg1 = a
// arg2 = b
var t = argument0;
var a = argument1;
var b = argument2;
return 6 * t * ( 1 - t ) * ( b - a );
