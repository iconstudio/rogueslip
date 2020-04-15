/// @description 행동 및 턴 넘기기
if turn_current_id() != id
	exit

if !turn_left {
	turn_left = true
	turn_go_next()
	exit
}

event_user(0)
turn_go_next()
