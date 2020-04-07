/// @description 
if global.flag_debug {
	draw_set_color($ffffff)
	draw_set_halign(2)
	draw_set_valign(0)
	draw_text(global.gui_width - 10, 10, "ABS TURN: " + string(global.turns_real))
	draw_text(global.gui_width - 10, 28, "TURN: " + string(global.turns))
	draw_text(global.gui_width - 10, 46, "PROGRESS: " + string(ds_queue_size(global.turn_queue)) + "/" + string(precache_size - 1))
}
