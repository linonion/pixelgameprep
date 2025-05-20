// param can be overridden by subclasses
move_type   = MOVE_TYPE.STAY;
shoot_type  = SHOOT_TYPE.NONE;

speed       = 1.5;
shoot_cd    = 60;      // 帧
shoot_timer = irandom(shoot_cd);  // 随机首发
det_radius  = 60;      // 检测玩家半径

max_hp = 3; 
hp = max_hp;
rotate_sprite = false;   // 子类可改

hurt_cd    = 0;      // 受击冷却帧计数（0 = 正常）
flash_step = 0;      // 用于闪白节奏
