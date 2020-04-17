/// @description entity_destroy()
/// @function entity_destroy
stat_move_info = 0
stat_attack_info[0] = 0
stat_attack_info[1] = 0
stat_attack_info = 0
if ds_exists(ds_type_list, stat_ability_info)
	ds_list_destroy(stat_ability_info)

var index = ds_list_find_index(global.turn_prelist, id)
if index != -1
	ds_list_delete(global.turn_prelist, index)
