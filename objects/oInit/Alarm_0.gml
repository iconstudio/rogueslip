instance_create_layer(0, 0, "System", oGlobal)
instance_create_layer(0, 0, "System", oGamepad)

display_set_gui_maximize()
global.gui_width = size_width
global.gui_height = size_height

if global.flag_is_mobile {
} else {
	window_center()
	window_set_position(window_get_x(), 48)
}

room_goto_next()