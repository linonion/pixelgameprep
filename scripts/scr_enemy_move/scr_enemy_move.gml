function scr_enemy_move(ent)
{
    // 预计算将要去的位置
    var nx, ny;

    switch (ent.move_type)
    {
        // ① 不动
        case MOVE_TYPE.STAY:
            return;     // 直接退出，省性能

        // ② 直线移动，可反弹
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

        // ③ 圆形移动：仅改方向角度，坐标照线性算
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

        // ④ 随机游走：偶尔换随机朝向
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

    // 真正移动：只有在“没撞墙”时才执行
    ent.x = nx;
    ent.y = ny;
}

