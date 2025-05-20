// obj_level_controller → Step  （生成出口）
if (!instance_exists(obj_exit) &&
    instance_number(obj_enemy_parent) == 0)
{
	/// 找到玩家
	var pl = instance_exists(obj_player) ? obj_player : noone;
	var ex, ey;

	if (pl != noone)
	{
	    // 1) 根据玩家 facing 转向向量
	    var dir = 0;
	    switch (pl.facing)      // 你的玩家对象里已有 "U/L/R/D"
	    {
	        case "U": dir = 90;  break;
	        case "D": dir = 270; break;
	        case "L": dir = 180; break;
	        case "R": dir = 0;   break;
	    }

	    // 2) 计算预期坐标：前方 48 像素
	    ex = pl.x + lengthdir_x(48, dir);
	    ey = pl.y + lengthdir_y(48, dir);

	    // 3) 若那位置撞墙，就放在玩家脚下
	    if (place_meeting(ex, ey, obj_solid))
	    {
	        ex = pl.x;
	        ey = pl.y;
	    }
	}
	else
	{
	    ex = 320;  ey = 180;   // 找不到玩家时仍放房间中央
	}

	// 创建出口
	instance_create_layer(ex, ey, "Instances", obj_exit,
	    { level_id: global.current_level });

}

// B) 玩家死亡自动回 Hub（这行疑似是多余代码，anyway之后改）
if (!instance_exists(obj_player)) {
	with (obj_player) { hp = max_hp; }
    room_goto(rm_hub);
}
