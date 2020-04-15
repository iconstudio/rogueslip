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

if turn_current_id() != id {
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
} else if pressed_hor {
	if check_io_time[0] <= 0 {
		if 0 < check_io_time[1]
			check_io_time[1] = check_io_period

		check_io_time[0] = check_io_period
		check_io_dir[0] = move_p[0]
	}
} else if pressed_ver {
	if check_io_time[1] <= 0 {
		if 0 < check_io_time[0]
			check_io_time[0] = check_io_period

		check_io_time[1] = check_io_period
		check_io_dir[1] = move_p[1]
	}
}

var moving_hor = (0 < check_io_time[0])
var moving_ver = (0 < check_io_time[1])
var moving_check = false
if 0 < check_io_time[0]
	check_io_time[0]--
else
	check_io_time[0] = 0
if 0 < check_io_time[1]
	check_io_time[1]--
else
	check_io_time[1] = 0

if moving_hor and moving_ver {
	if check_io_time[0] <= 0 and check_io_time[1] <= 0 {
		moving_check = true
	}
} else if moving_hor {
	if check_io_time[0] <= 0 {
		moving_check = true
		check_io_dir[1] = 0
	}
} else if moving_ver {
	if check_io_time[1] <= 0 {
		moving_check = true
		check_io_dir[0] = 0
	}
} else if global.io_pressed_autoaction { // 자동 행동
	
} else if global.io_pressed_wait { // 대기
	action = act.wait
}

if moving_check {
	var on_wall = check_collide_vector(check_io_dir[0], check_io_dir[1])
	var on_entity = check_entity_vector(check_io_dir[0], check_io_dir[1])
	if on_wall {
		action = act.none
	} else if on_entity { // 상호작용
		target_action = on_entity
		if target_action.stat_force == allies.player { // 완전히 동맹
			// 위치 바꾸기
			if entity_is_sane(target_action) {
				action = act.swap
			}
		} else if target_action.stat_force == allies.ally_with_player { // 동맹
			// 위치 바꾸기
			if entity_is_sane(target_action) {
				action = act.swap
			}
		} else if target_action.stat_force == allies.neutral { // 중립
			// 일정 조건 하에 위치 바꾸기 혹은 다른 상호작용
			target_last = target_action
			if entity_is_sane(target_action) {
				action = act.swap
			} else {
				
			}
		} else if target_action.stat_force == allies.hosties { // 적대적
			// 근접 공격
			action = act.attack
			target_last = target_action
		} else {
			// 위치 바꾸기
			if entity_is_sane(target_action) {
				action = act.swap
			}
		}
	} else { // 이동
		action = act.move
		target_x = x + check_io_dir[0] * GRID
		target_y = y + check_io_dir[1] * GRID
		check_io_time[0] = 0
		check_io_time[1] = 0
	}
}

if action != act.none {
	switch action {
		case act.attack:
			player_attack(target_action)
			turn_left = false
		break

		case act.move:
			x = target_x
			y = target_y
			turn_left = false
		break

		case act.wait:
			turn_left = false
		break
		case act.swap:
			turn_left = false
			entity_swap_position(target_action)
		break

		default:
		break
	}
}

// 턴 넘기기
if !turn_left {
	turn_left = true
	move_p = 0
	action = act.none
	turn_go_next()
}

