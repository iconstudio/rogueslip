/// @description 
if global.flag_debug {
	draw_set_color($ffffff)
	draw_set_halign(2)
	draw_text(630, 10, "ABS TURN: " + string(global.turns_real))
	draw_text(630, 28, "TURN: " + string(global.turns))
}
