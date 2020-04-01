/// @description 게임 초기화
enum cursor {
	normal, 
	attack, // 근거리와 원거리 모두 포함
	throw, 
	find, // Ctrl-X
	pause
}
global.cursor_mode = cursor.normal

precache_size = 0

global.player_id = noone
event_user(1)
event_user(8)
event_user(9)
