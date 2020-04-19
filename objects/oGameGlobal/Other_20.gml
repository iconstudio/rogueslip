/// @description 턴 진행
var left = ds_queue_size(global.turn_queue)
if 0 < left {
	global.turn_current_id = ds_queue_dequeue(global.turn_queue)
	if instance_exists(global.turn_current_id) {
		with global.turn_current_id {
			
		}

		global.turns += 1.0 // 나중엔 따로 처리를 해줘야할 것.
		global.turns_real++

		if left - 1 <= 0
			event_user(9)
	} else {
		event_user(10)
	}
} else {
	event_user(9)
}
