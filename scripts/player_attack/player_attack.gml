/// @description player_attack(target)
/// @function player_attack
/// @param target { instance }
var target = argument0
var damage = 1

with target {
	hurt = damage
	event_user(14)
}
