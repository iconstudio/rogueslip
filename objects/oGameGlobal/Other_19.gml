/// @description 턴 큐 초기화 (여러번 실행됨)
ds_queue_clear(global.turn_queue)
if 0 < precache_size {
	for (var i = 0; i < precache_size; ++i)
		ds_queue_enqueue(global.turn_queue, global.turn_prelist[| i])
}
