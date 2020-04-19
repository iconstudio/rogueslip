/// @description entity_deregister(entity)
/// @function entity_deregister
/// @param entity { instance }
var index = ds_list_find_index(global.turn_prelist, argument0)
if index != -1
	ds_list_delete(global.turn_prelist, index)
with oGameGlobal
	precache_size = ds_list_size(global.turn_prelist)
