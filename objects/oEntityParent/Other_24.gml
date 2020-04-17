/// @description 피해 입음
if 0 < hurt {
	stat_hp -= hurt
	if stat_hp <= 0 {
		event_user(15)
	} else {
		
	}
	hurt = 0
}
