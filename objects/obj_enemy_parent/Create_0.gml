// 可被子类覆盖的默认值
move_type   = MOVE_TYPE.STAY;
shoot_type  = SHOOT_TYPE.NONE;

speed       = 1.5;
shoot_cd    = 60;      // 帧
shoot_timer = irandom(shoot_cd);  // 随机首发
det_radius  = 60;      // 发现玩家半径

max_hp = 3; 
hp = max_hp;
rotate_sprite = false;   // 子类可改成 true
