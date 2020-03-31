/// @description 행동
if global.turn_current_id != id
	exit

if x <= 0
	x += GRID
else if room_width - 16 <= x
	x -= GRID
else
	x += GRID * choose(-1, 1)

if y <= 0
	y += GRID
else if room_height - 16 <= y
	y -= GRID
else
	y += GRID * choose(-1, 1)

turn_go_next()
