/// @description 행동
var check_io_l = global.io_left
var check_io_r = global.io_right
var check_io_u = global.io_up
var check_io_d = global.io_down

var check_io_p_l = global.io_pressed_left
var check_io_p_r = global.io_pressed_right
var check_io_p_u = global.io_pressed_up
var check_io_p_d = global.io_pressed_down
/*
var move_hor = check_io_r - check_io_l
var move_ver = check_io_d - check_io_u
var pressing_hor = (move_hor != 0)
var pressing_ver = (move_ver != 0)
*/
var move_hor_p = check_io_p_r - check_io_p_l
var move_ver_p = check_io_p_d - check_io_p_u
var pressed_hor = (move_hor_p != 0)
var pressed_ver = (move_ver_p != 0)

if pressed_hor and pressed_ver {
	x += move_hor_p * GRID
	y += move_ver_p * GRID
} else if pressed_hor {
	if check_io_time_vertical == 0 {
		
	} else {
		
	}
	if check_io_time_horizontal == 0 {
		check_io_time_horizontal = check_io_duration
	} else {
		x += move_hor_p * GRID
	}
} else if pressed_ver {
	y += move_ver_p * GRID
}



