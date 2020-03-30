/// @description 턴 큐 초기화 (여러번 실행됨)
ds_queue_clear(global.turn_queue)
for (var i = 0; i < ds_list_size(global.turn_prelist); ++i)
	ds_queue_enqueue(global.turn_queue, global.turn_prelist[| i])
