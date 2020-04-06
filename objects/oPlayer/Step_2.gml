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

if instance_exists(oGamepad) and oGamepad.index != -1
	check_io_period = check_io_duration_gamepad
else
	check_io_period = check_io_duration

if pressed_hor and pressed_ver {
	check_io_time[0] = check_io_period
	check_io_time[1] = check_io_period
	check_io_dir[0] = move_p[0]
	check_io_dir[1] = move_p[1]
	show_debug_message("diagonal")
} else if pressed_hor {
	if check_io_time[0] <= 0 {
		if check_io_time[1] != 0
			check_io_time[1] = check_io_period
		else
			check_io_dir[1] = 0

		check_io_time[0] = check_io_period
		check_io_dir[0] = move_p[0]
		show_debug_message("horizontal")
		show_debug_message(check_io_dir[0])
		show_debug_message(check_io_dir[1])
	}
} else if pressed_ver {
	if check_io_time[1] <= 0 {
		if check_io_time[0] != 0
			check_io_time[0] = check_io_period
		else
			check_io_dir[0] = 0

		check_io_time[1] = check_io_period
		check_io_dir[1] = move_p[1]
		show_debug_message("vertical")
		show_debug_message(check_io_dir[0])
		show_debug_message(check_io_dir[1])
	}
}

var moving_hor = (0 < check_io_time[0])
var moving_ver = (0 < check_io_time[1])
if moving_hor or moving_ver {
	if --check_io_time[0] <= 0 or --check_io_time[1] <= 0 {
		var on_wall = check_collide_vector(check_io_dir[0], check_io_dir[1])
		var on_entity = check_entity_vector(check_io_dir[0], check_io_dir[1])
		if on_wall {
			action = ACT_NONE
		} else if on_entity { // 상호작용
			action = ACT_ATTACK
			target_action = on_entity
		} else { // 이동
			action = ACT_MOVE
			target_x = x + check_io_dir[0] * GRID
			target_y = y + check_io_dir[1] * GRID
			check_io_time[0] = 0
			check_io_time[1] = 0
		}
	}
} else if global.io_pressed_wait { // 대기
	action = ACT_WAIT
}

if action != ACT_NONE {
	switch action {
		case ACT_ATTACK:
			turn_left = false
		break

		case ACT_MOVE:
			x = target_x
			y = target_y
			//check_io_dir[0] = 0
			//check_io_dir[1] = 0
			turn_left = false
		break

		case ACT_WAIT:
			turn_left = false
		break

		default:
		break
	}
}

// 턴 넘기기
if !turn_left {
	turn_left = true
	move_p = 0
	action = ACT_NONE
	turn_go_next()
}

