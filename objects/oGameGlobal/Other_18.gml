/// @description 턴 순서 초기화
ds_list_clear(global.turn_prelist)

var temp_list = ds_list_create()
with oEntityParent
	ds_list_add(temp_list, id)
ds_list_shuffle(temp_list)

ds_list_add(global.turn_prelist, global.player_id)
for (var i = 0; i < ds_list_size(temp_list); ++i)
	ds_list_add(global.turn_prelist, temp_list[| i])
if instance_exists(global.player_id)
	ds_list_add(global.turn_prelist, global.player_id)
ds_list_destroy(temp_list)

precache_size = ds_list_size(global.turn_prelist)
