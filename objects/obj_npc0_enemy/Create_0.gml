// obj_npc0_enemy → Create
event_inherited()
max_hp     = 2;
move_type  = MOVE_TYPE.CIRCLE;
shoot_type = SHOOT_TYPE.TOWARD_PLAYER;
shoot_cd   = irandom_range(60, 90); // 随机每1~1.5秒一发
speed      = 0.2;
