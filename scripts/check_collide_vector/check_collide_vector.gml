/// @description check_collide_vector(cx, cy)
/// @function check_collide_vector
/// @param cx { integer }
/// @param cy { integer }
var rx = x, ry = y
if argument0 != 0
	rx = x + argument0 * GRID + GRID * 0.5
if argument1 != 0
	ry = y + argument1 * GRID + GRID * 0.5

return check_collide(rx, ry)
