/// @description 초기화
global.io_left = false
global.io_right = false
global.io_up = false
global.io_down = false

global.io_pressed_left = false
global.io_pressed_right = false
global.io_pressed_up = false
global.io_pressed_down = false
global.io_pressed_autoaction = false
global.io_pressed_dash = false
global.io_released_hang = false

global.io_released_jump = keyboard_check_released(vk_space) or keyboard_check_released(ord("X"))
global.io_pressed_yes = global.io_pressed_jump or keyboard_check_pressed(vk_enter)
global.io_pressed_no = global.io_pressed_dash
global.io_pressed_exit = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace)

global.turn = 0.0
global.turn_prelist = ds_list_create()
global.turn_queue = ds_queue_create()
