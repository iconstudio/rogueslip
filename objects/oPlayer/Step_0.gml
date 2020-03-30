/// @description 행동
var check_io_l = global.io_left
var check_io_r = global.io_right
var check_io_u = global.io_up
var check_io_d = global.io_down

var check_io_p_l = global.io_pressed_left
var check_io_p_r = global.io_pressed_right
var check_io_p_u = global.io_pressed_up
var check_io_p_d = global.io_pressed_down

var move_hor = check_io_p_r - check_io_p_l
var move_ver = check_io_p_d - check_io_p_u

if move_hor != 0 or move_ver != 0 {
	
}
