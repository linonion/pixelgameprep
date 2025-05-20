/// 常量
event_inherited();
has_weapon = false;
walk_spd = 2;
dash_spd = 6;
dash_frames = 5;
dash_cool   = 20;

facing          = "D";   // U / D / L / R，上下左右
facing_angle = 270;   // facing初始角度，与初始 facing="D" 对应，方便初始判定
walk_anim_speed = 0.25;  // 走路速度
hit_done        = false; // 只在一次攻击内 true


atk1_anim_speed = 0.5;   // atk1攻击播放帧长度，6 帧 × 0.5 = 12 步播放完
atk2_anim_speed = 0.5;   // atk2攻击播放帧长度


/// 变量
hsp = 0; 
vsp = 0;
dash_timer = 0;
cool_timer = 0;
direction  = 0;
can_attack = false;

max_hp =15;
hp = max_hp;

if (!variable_global_exists("dialog_cd"))
    global.dialog_cd = 0;

// 近战参数
atk1_range  = 60;
atk2_range  = 70;
atk_cool    = 15;   // 共用冷却帧数
atk_timer   = 0;    // 计时器
state       = "IDLE"; // "IDLE" / "ATK1" / "ATK2"

shoot_cd     = 12;    // 200ms
shoot_timer  = 0;

// 敌人碰撞参数

knock_len  = 6;      // 我改了推回距离，因为推回太多玩起来不爽
knock_cd   = 0;      // 弹开冷却

hurt_cd    = 30;      // 无敌帧计数（闪白时减 1）
flash_step = 0;      // 用于 Draw 闪白
