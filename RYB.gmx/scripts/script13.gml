///tie_rgb_to_ryb()

/*
def rgb_to_ryb(iR, iG, iB, tol=0.0001):
    target = Vec3(iR, iG, iB)
    current_guess = Vec3(0.5, 0.5, 0.5)
    while True:
        guess_result = ryb_to_rgb(*current_guess)
        x_dir = ryb_to_rgb(*current_guess, dr=True)
        y_dir = ryb_to_rgb(*current_guess, dy=True)
        z_dir = ryb_to_rgb(*current_guess, db=True)
        distance = target - guess_result
        if distance.x*distance.x+distance.y*distance.y+distance.z*distance.z < tol * tol:
            return current_guess
        # Newton-Raphson
        J = np.array([list(x_dir), list(y_dir), list(z_dir)]).T
        current_guess += Vec3(*np.linalg.solve(J, np.array(list(distance))))
*/

var _target_r = argument0;
var _target_g = argument1;
var _target_b = argument2;

var _current_r = 0.5;
var _current_g = 0.5;
var _current_b = 0.5;

while( true ) {
    
    var _guess = make_colour_ryb( _current_r, _current_y, _current_b );
    
    var _x_dir = 0;
    
    
    
    
    
    
    
}







