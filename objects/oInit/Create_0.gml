#region 일반
global.flag_debug = false
global.flag_is_mobile = (os_type == os_android or os_type == os_ios) // 하지만 안드로이드만 지원
global.flag_is_browser = (os_browser != browser_not_a_browser)
global.flag_is_desktop = (os_type == os_windows or os_type == os_macosx or os_type == os_linux) and !global.flag_is_browser
#macro SECOND 100 // == seconds(1)
#macro GRID 16

randomize()
device_mouse_dbclick_enable(false)
#endregion

#region 화면
application_surface_enable(true)
application_surface_draw_enable(true)
surface_depth_disable(true)
gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
display_set_timing_method(tm_countvsyncs)

if global.flag_is_mobile {
	display_set_sleep_margin(4)
	window_set_fullscreen(true)
	os_powersave_enable(false)
} else if global.flag_is_browser {
	display_set_sleep_margin(30)
} else {
	display_set_sleep_margin(10)
}

#endregion

#region 음성
audio_loaded = true
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

alarm[0] = 1
