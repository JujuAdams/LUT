///ryb_to_rgb_blue( red, yellow, blue )
// arg0 = red
// arg1 = yellow
// arg2 = blue

var red = argument0;
var yellow = argument1;
var blue = argument2;

var x0 = cubic_interpolation( blue, color_get_blue( c_magic_white  ), color_get_blue( c_magic_blue   ) );   // white r -> blue r
var x1 = cubic_interpolation( blue, color_get_blue( c_magic_yellow ), color_get_blue( c_magic_green  ) );   // yellow r -> green r
var x2 = cubic_interpolation( blue, color_get_blue( c_magic_red    ), color_get_blue( c_magic_purple ) );   // red r -> purple r
var x3 = cubic_interpolation( blue, color_get_blue( c_magic_orange ), color_get_blue( c_magic_black  ) );   // orange r -> black r

var y0 = cubic_interpolation( yellow , x0, x1 );
var y1 = cubic_interpolation( yellow , x2, x3 );

return ceil( cubic_interpolation( red, y0, y1 ) );

/*

var x0 = cubicInt(iB, magic[0][2], magic[4][2]);
var x1 = cubicInt(iB, magic[1][2], magic[5][2]);
var x2 = cubicInt(iB, magic[2][2], magic[6][2]);
var x3 = cubicInt(iB, magic[3][2], magic[7][2]);
      
  var MAGIC_COLORS = [
    [1,     1,     1],   //white
    [1,     1,     0],   //yellow
    [1,     0,     0],   //red
    [1,     0.5,   0],   //orange
    [0.163, 0.373, 0.6], //blue
    [0.0,   0.66,  0.2], //green
    [0.5,   0.0,   0.5], //purple
    [0.2,   0.094, 0.0]  //black
  ];
*/

/*
var x0 = cubic_interpolation( blue , 1.0, 0.6 );
var x1 = cubic_interpolation( blue , 0.0, 0.2 );
var x2 = cubic_interpolation( blue , 0.0, 0.5 );
var x3 = cubic_interpolation( blue , 0.0, 0.0 );
