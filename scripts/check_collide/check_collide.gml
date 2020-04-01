/// @description check_collide(cx, cy)
/// @function check_collide
/// @param cx { integer }
/// @param cy { integer }
var rx = x, ry = y
if argument0 != 0
	rx = x + argument0 * GRID + GRID * 0.5
if argument1 != 0
	ry = y + argument1 * GRID + GRID * 0.5

return 0 < collision_point(rx, ry, oWallParent, false, true)
