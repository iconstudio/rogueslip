/// @description 게임 정보 그리기
draw_set_color($ffffff)
if global.flag_debug {
	draw_set_halign(2)
	draw_set_valign(2)
	draw_text(global.gui_width - 10, global.gui_height - 46, "ABS TURN: " + string(global.turns_real))
	draw_text(global.gui_width - 10, global.gui_height - 28, "TURN: " + string(global.turns))
	draw_text(global.gui_width - 10, global.gui_height - 10, "PROGRESS: " + string(ds_queue_size(global.turn_queue)) + "/" + string(precache_size - 1))
}
