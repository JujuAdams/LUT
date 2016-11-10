///ryb_to_rgb_green( red, yellow, blue )
// arg0 = red
// arg1 = yellow
// arg2 = blue

var red = argument0;
var yellow = argument1;
var blue = argument2;

var x0 = cubic_interpolation( blue, color_get_green( c_magic_white  ), color_get_green( c_magic_blue   ) );   // white r -> blue r
var x1 = cubic_interpolation( blue, color_get_green( c_magic_yellow ), color_get_green( c_magic_green  ) );   // yellow r -> green r
var x2 = cubic_interpolation( blue, color_get_green( c_magic_red    ), color_get_green( c_magic_purple ) );   // red r -> purple r
var x3 = cubic_interpolation( blue, color_get_green( c_magic_orange ), color_get_green( c_magic_black  ) );   // orange r -> black r

var y0 = cubic_interpolation( yellow, x0, x1 );
var y1 = cubic_interpolation( yellow, x2, x3 );

return ceil( cubic_interpolation( red, y0, y1 ) );


/*

 var x0 = cubicInt(iB, magic[0][1], magic[4][1]);
 var x1 = cubicInt(iB, magic[1][1], magic[5][1]);
 var x2 = cubicInt(iB, magic[2][1], magic[6][1]);
 var x3 = cubicInt(iB, magic[3][1], magic[7][1]);
      
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
var x0 = cubic_interpolation( blue, 1.0, 0.373 );
var x1 = cubic_interpolation( blue, 1.0, 0.66 );
var x2 = cubic_interpolation( blue, 0.0, 0.0 );
var x3 = cubic_interpolation( blue, 0.5, 0.094 );
