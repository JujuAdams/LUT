///cubic_interpolation( t, a, b )

var t = argument0;
var a = argument1;
var b = argument2;

return a + ( sqr(t) * ( 3 - 2*t ) ) * ( b - a);
