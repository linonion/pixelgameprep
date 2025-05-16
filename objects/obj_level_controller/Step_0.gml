// obj_level_controller → Step  （生成出口）
if (!instance_exists(obj_exit) &&
    instance_number(obj_enemy_parent) == 0)
{
    instance_create_layer(
        320, 180, "Instances", obj_exit,
        { level_id: level_id } );     // 这第五个参数就是 struct
}

// B) 玩家死亡自动回 Hub（可选）
if (!instance_exists(obj_player)) {
	with (obj_player) { hp = max_hp; }
    room_goto(rm_hub);
}
