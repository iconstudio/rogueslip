/// @description 입력 처리
global.io_left = keyboard_check(vk_left)
global.io_right = keyboard_check(vk_right)
global.io_up = keyboard_check(vk_up)
global.io_down = keyboard_check(vk_down)

global.io_pressed_left = keyboard_check_pressed(vk_left)
global.io_pressed_right = keyboard_check_pressed(vk_right)
global.io_pressed_up = keyboard_check_pressed(vk_up)
global.io_pressed_down = keyboard_check_pressed(vk_down)

global.io_pressed_autoaction = io_check_autoaction()
global.io_pressed_wait = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_numpad5)
global.io_pressed_inventory = keyboard_check_pressed(ord("I")) or keyboard_check_pressed(ord("E"))
global.io_pressed_status = keyboard_check_pressed(ord("%")) or keyboard_check_pressed(ord("@"))
global.io_pressed_menu = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace)

global.io_pressed_yes = keyboard_check_pressed(vk_enter)
global.io_pressed_no = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace)
global.io_pressed_back = global.io_pressed_no
