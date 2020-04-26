/// @description entity_init()
/// @function entity_init
//struct status {
move_snap(GRID, GRID)

stat_name = "" // 이름
stat_honor = "" // 칭호
stat_force = allies.none
stat_level = 0
stat_exp_dead = 1
stat_hp = 10
stat_hp_max = stat_hp
stat_mp = 1
stat_mp_max = stat_mp
stat_ac = 0 // 방어력
stat_ev = 0 // 회피
stat_sh = 0 // 방패, 패링
stat_sight = 8

// 이동 방식
stat_move_info = [0]
stat_move_can_door_open = true

// 활성화 여부, 공격 종류, 최소 공격력, 주사위 면, 주사위 갯수, 사정거리 {타일}, 공격 실행 스크립트(목표)
stat_attack_info = array_create(2, [false, 0, 0, 0, 0, 0, -1])

// 미리 만들어진 능력의 정보를 갖고 온다.
stat_ability_info = ds_list_create()

stat_status_queue = ds_list_create()

//}

hurt = 0
action = act.none
target_action = noone
target_last = noone
target_x = 0
target_y = 0
turn_left = true
stun_time = 0
