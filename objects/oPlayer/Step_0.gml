/// @description 행동
/*
var check_io_l = global.io_left
var check_io_r = global.io_right
var check_io_u = global.io_up
var check_io_d = global.io_down
*/
var check_io_p_l = global.io_pressed_left
var check_io_p_r = global.io_pressed_right
var check_io_p_u = global.io_pressed_up
var check_io_p_d = global.io_pressed_down

if global.turn_current_id != id {
	exit
} else if global.cursor_mode == cursor.attack {
	
	exit
} else if global.cursor_mode == cursor.throw {
	
	exit
} else if global.cursor_mode == cursor.find {
	
	exit
} else if global.cursor_mode == cursor.pause {
	
	exit
}

/*
var move_hor = check_io_r - check_io_l
var move_ver = check_io_d - check_io_u
var pressing_hor = (move_hor != 0)
var pressing_ver = (move_ver!= 0)
*/
var move_p = [0, 0]
move_p[0] = check_io_p_r - check_io_p_l
move_p[1] = check_io_p_d - check_io_p_u
var pressed_hor = (move_p[0] != 0)
var pressed_ver = (move_p[1] != 0)

if pressed_hor and pressed_ver {
	/*
	if !check_collide(move_p[0], move_p[1]) {
		x += move_p[0] * GRID
		y += move_p[1] * GRID
		check_io_time[0] = 0
		check_io_time[1] = 0

		turn_left = false
	}
	*/
	check_io_time[0] = check_io_duration
	check_io_time[1] = check_io_duration
	check_io_dir[0] = move_p[0]
	check_io_dir[1] = move_p[1]
} else if pressed_hor {
	/*
	if check_io_time[0] == 0 {
		if check_io_time[1] != 0 {
			if !check_collide(move_p[0], check_io_dir[1]) {
				check_io_time[0] = check_io_duration
				check_io_dir[0] = move_p[0]
				check_io_time[1] = check_io_duration
			}
		} else if !check_collide(move_p[0], 0) {
			check_io_time[0] = check_io_duration
			check_io_dir[0] = move_p[0]
		}
	}
	*/
	if check_io_time[0] == 0 {
		if check_io_time[1] != 0 {
			check_io_time[1] = check_io_duration
		}
		check_io_time[0] = check_io_duration
		check_io_dir[0] = move_p[0]
	}
} else if pressed_ver {
	/*
	if check_io_time[1] == 0 {
		if check_io_time[0] != 0 {
			if !check_collide(check_io_dir[0], move_p[1]) {
				check_io_time[1] = check_io_duration
				check_io_dir[1] = move_p[1]
				check_io_time[0] = check_io_duration
			}
		} else if !check_collide(0, move_p[1]) {
			check_io_time[1] = check_io_duration
			check_io_dir[1] = move_p[1]
		}
	}
	*/
	if check_io_time[1] == 0 {
		if check_io_time[0] != 0 {
			check_io_time[0] = check_io_duration
		}
		check_io_time[1] = check_io_duration
		check_io_dir[1] = move_p[1]
	}
}

var moving_hor = (0 < check_io_time[0])
var moving_ver = (0 < check_io_time[1])
if moving_hor and moving_ver {
	if --check_io_time[0] <= 0 or --check_io_time[1] <= 0 {
		if !check_collide(check_io_dir[0], check_io_dir[1]) {
			x += check_io_dir[0] * GRID
			y += check_io_dir[1] * GRID
			check_io_time[0] = 0
			check_io_time[1] = 0

			turn_left = false
		} else {
			check_io_time[0] = 0
			check_io_time[1] = 0
		}
	}
} else if moving_hor {
	if --check_io_time[0] <= 0 {
		if !check_collide(check_io_dir[0], 0) {
			x += check_io_dir[0] * GRID
			check_io_time[0] = 0

			turn_left = false
		} else {
			check_io_time[0] = 0
		}
	}
} else if moving_ver {
	if --check_io_time[1] <= 0 {
		if !check_collide(0, check_io_dir[1]) {
			y += check_io_dir[1] * GRID
			check_io_time[1] = 0

			turn_left = false
		} else {
			check_io_time[1] = 0
		}
	}
}

// 턴 넘기기
if !turn_left {
	turn_left = true
	move_p = 0
	turn_go_next()
}

