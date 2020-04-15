if x <= 0
	x += GRID
else if room_width - GRID <= x
	x -= GRID
else
	x += GRID * choose(-1, 1)

if y <= 0
	y += GRID
else if room_height - GRID <= y
	y -= GRID
else
	y += GRID * choose(-1, 1)
