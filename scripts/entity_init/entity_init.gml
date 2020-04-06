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

// 이동 방식
stat_move_info = [0]
stat_move_can_door_open = true

// 공격 종류, 공격력, 사정거리, 공격 실행 스크립트(목표), 피격 시 스크립트
stat_attack_info = array_create(2, [0, 0, 0, -1, -1])

// 미리 만들어진 능력의 정보를 갖고 온다.
stat_ability_info = ds_list_create()

//}

// 행동
ACT_NONE = 0
ACT_WAIT = 1
ACT_MOVE = 3
ACT_ATTACK = 10
action = ACT_NONE
target_action = noone
target_last = noone
target_x = 0
target_y = 0
