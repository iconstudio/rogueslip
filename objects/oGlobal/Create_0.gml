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
global.io_pressed_wait = false
global.io_pressed_inventory = false
global.io_pressed_status = false
global.io_pressed_menu = false

global.io_pressed_yes = false
global.io_pressed_no = false
global.io_pressed_back = false

global.turns = 0.0
global.turns_real = 0
global.turn_prelist = ds_list_create()
global.turn_queue = ds_queue_create()
global.turn_current_id = noone

// 청크가 3x3칸
enum theme {
	castle,
	cave
}
global.map_theme = theme.castle
global.map_data = ds_grid_create(3, 3)

key_e = ord("E")
key_i = ord("I")
key_s = ord("S")
key_status_1 = ord("@")
key_status_2 = ord("%")
key_status_3 = ord("=")
key_inventory = ord("/")
key_dot = ord(".")
