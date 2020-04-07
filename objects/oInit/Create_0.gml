#region 일반
global.flag_debug = true
global.flag_is_mobile = (os_type == os_android or os_type == os_ios) // 하지만 안드로이드만 지원
global.flag_is_browser = (os_browser != browser_not_a_browser)
global.flag_is_desktop = (os_type == os_windows or os_type == os_macosx or os_type == os_linux) and !global.flag_is_browser
#macro SECOND 100 // == seconds(1)
#macro GRID 16

randomize()
device_mouse_dbclick_enable(false)
#endregion

#region 설정
global.setting_show_bars = true
global.setting_show_name = true

#endregion

#region 화면
application_surface_enable(true)
application_surface_draw_enable(true)
surface_depth_disable(true)
gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
display_set_timing_method(tm_countvsyncs)

// 비율은 4 : 3
default_width = 640
default_height = 480
over_width = 160
size_width = default_width + over_width * 2
size_height = default_height
if global.flag_is_mobile {
	display_set_sleep_margin(4)
	window_set_fullscreen(true)
	os_powersave_enable(false)
	var dw = display_get_width()
	var dh = display_get_height()
	over_width = (dw - dh * 4 / 3) * 0.5
	size_width = dw
	size_height = dh
} else if global.flag_is_browser {
	display_set_sleep_margin(30)
} else {
	display_set_sleep_margin(10)

	if global.flag_is_desktop {
		window_set_size(size_width, size_height)
	}
}

#endregion

#region 음성
if global.flag_is_mobile {
	audio_channel_num(16)
} else if global.flag_is_browser {
	audio_channel_num(4)
} else {
	audio_channel_num(32)
}
/*
if !audio_group_is_loaded(audiogroup_everthing) {
	audio_group_load(audiogroup_everthing)
	audio_loaded = false
}
*/
#endregion

enum cursor {
	normal, 
	attack, // 근거리와 원거리 모두 포함
	throw, 
	find, // Ctrl-X
	pause
}

enum allies {
	none,
	player,
	neutral,
	hosties
}

alarm[0] = 1
