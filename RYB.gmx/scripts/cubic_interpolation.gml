///cubic_interpolation( t, a, b )
// arg0 = t
// arg1 = a
// arg2 = b
var t = argument0;
var a = argument1;
var b = argument2;
return a + ( sqr(t) * ( 3 - 2*t ) ) * ( b - a);
