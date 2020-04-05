/// @description 패드 입력
if index == -1
	exit

var check_axis_h = gamepad_axis_value(index, gp_axislh)
var check_axis_v = gamepad_axis_value(index, gp_axislv)
global.io_left |= gamepad_button_check(index, gp_padl) or check_axis_h < -threshold
global.io_right |= gamepad_button_check(index, gp_padr) or threshold < check_axis_h
global.io_up |= gamepad_button_check(index, gp_padu) or check_axis_v < -threshold
global.io_down |= gamepad_button_check(index, gp_padd) or threshold < check_axis_v

global.io_pressed_left |= gamepad_button_check_pressed(index, gp_padl)
if !stick_hvalue_thresh and check_axis_h < -threshold {
	stick_hvalue_thresh = true
	global.io_pressed_left = true
}
global.io_pressed_right |= gamepad_button_check_pressed(index, gp_padr)
if !stick_hvalue_thresh and threshold < check_axis_h {
	stick_hvalue_thresh = true
	global.io_pressed_right = true
}
global.io_pressed_up |= gamepad_button_check_pressed(index, gp_padu)
if !stick_vvalue_thresh and check_axis_v < -threshold {
	stick_vvalue_thresh = true
	global.io_pressed_up = true
}
global.io_pressed_down |= gamepad_button_check_pressed(index, gp_padd)
if !stick_vvalue_thresh and threshold < check_axis_v {
	stick_vvalue_thresh = true
	global.io_pressed_down = true
}

if -threshold <= check_axis_h and check_axis_h <= threshold
	stick_hvalue_thresh = false
if -threshold <= check_axis_v and check_axis_v <= threshold
	stick_vvalue_thresh = false
