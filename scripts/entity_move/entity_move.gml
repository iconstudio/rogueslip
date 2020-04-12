/// @description entity_move(vx, vy)
/// @function entity_move
/// @param vx { integer }
/// @param vy { integer }
xprevious = x
yprevious = y

var vec_h = argument0 * GRID
var vec_v = argument1 * GRID

if x + vec_h < GRID {
	x = 0
	vec_h = 0
} else if room_width - GRID < x + vec_h {
	x = room_width - GRID
	vec_h = 0
}

if y + vec_v < GRID {
	y = 0
	vec_v = 0
} else if room_height - GRID < y + vec_v {
	y = room_height - GRID
	vec_v = 0
}
