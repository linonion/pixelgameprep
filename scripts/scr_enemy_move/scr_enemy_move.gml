//敌人移动代码
function scr_enemy_move(ent)
{
    // 预计算将要去的位置
    var nx, ny;

    switch (ent.move_type)
    {
        // 1 不动
        case MOVE_TYPE.STAY:
            return;     

        // 2 linear移动，遇到solide砖块反弹
        case MOVE_TYPE.LINEAR:
            nx = ent.x + lengthdir_x(ent.speed, ent.direction);
            ny = ent.y + lengthdir_y(ent.speed, ent.direction);

            // 如果前方有墙 → 方向加 180°（反弹）并提前退出
            if (place_meeting(nx, ny, obj_solid))
            {
                ent.direction = (ent.direction + 180) mod 360;
                return;
            }
            break;

        // 3 圆形移动：仅改方向角度，坐标照线性算
        case MOVE_TYPE.CIRCLE:
            ent.direction = (ent.direction + 2) mod 360;
            nx = ent.x + lengthdir_x(ent.speed, ent.direction);
            ny = ent.y + lengthdir_y(ent.speed, ent.direction);
            if (place_meeting(nx, ny, obj_solid))
            {
                ent.direction = (ent.direction + 180) mod 360;
                return;
            }
            break;

        // 4 随机游走：偶尔换随机朝向（待调整）
        case MOVE_TYPE.RANDOM:
            if (irandom(60) == 0) ent.direction = irandom(359);
            nx = ent.x + lengthdir_x(ent.speed, ent.direction);
            ny = ent.y + lengthdir_y(ent.speed, ent.direction);

            if (place_meeting(nx, ny, obj_solid))
            {
                ent.direction = irandom(359);   // 随机换向
                return;
            }
            break;
    }
	// 判断边界
    // 4 边界：minX / maxX / minY / maxY   
	// ① 根据当前方向算位移向量
	var dx = lengthdir_x(ent.speed, ent.direction);
	var dy = lengthdir_y(ent.speed, ent.direction);

	// ② 预测位置
	var nx = ent.x + dx;
	var ny = ent.y + dy;

	// ③ 左右边界检测 → 翻转 dx
	if (variable_instance_exists(ent,"minX") && nx < ent.minX) {
	    nx = ent.minX;       // 贴边
	    dx = -dx;            // 反弹
	}
	if (variable_instance_exists(ent,"maxX") && nx > ent.maxX) {
	    nx = ent.maxX;
	    dx = -dx;
	}

	// ④ 上下边界检测 → 翻转 dy
	if (variable_instance_exists(ent,"minY") && ny < ent.minY) {
	    ny = ent.minY;
	    dy = -dy;
	}
	if (variable_instance_exists(ent,"maxY") && ny > ent.maxY) {
	    ny = ent.maxY;
	    dy = -dy;
	}

	// ⑤ 真正移动
	ent.x = nx;
	ent.y = ny;

	// ⑥ 用新 dx,dy 重新定义方向（保持 0-360°）
	if (dx != 0 || dy != 0) {
	    ent.direction = (point_direction(0,0, dx, dy) + 360) mod 360;
	}
}

