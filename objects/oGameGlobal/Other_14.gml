/// @description 턴 진행
var left = ds_list_size(global.turn_prelist)
if 0 < left {
	if instance_exists(global.turn_current_id) {
		with global.turn_current_id {
			
		}
	}

	ds_list_delete(global.turn_prelist, 0)
	global.turns += 1.0 // 나중엔 따로 처리를 해줘야할 것.
	global.turns_real++
	global.turn_current_id = global.turn_prelist[| 0]
} else {
	event_user(3)
}
