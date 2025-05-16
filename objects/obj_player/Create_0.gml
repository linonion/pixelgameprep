/// 常量
event_inherited();
has_weapon = false;
walk_spd = 2;
dash_spd = 6;
dash_frames = 5;
dash_cool   = 20;

facing          = "D";   // U / D / L / R
facing_angle = 270;   // 与初始 facing="D" 对应，方便初始判定
walk_anim_speed = 0.25;  // 可再调
hit_done        = false; // 只在一次攻击内 true
// obj_player → Create （inherited() 之后）
atk1_anim_speed = 0.5;   // 6 帧 × 0.5 = 12 步播放完
atk2_anim_speed = 0.5;   // 若长攻击也同速，可用同一个数


/// 变量
hsp = 0; 
vsp = 0;
dash_timer = 0;
cool_timer = 0;
direction  = 0;
can_attack = false;

max_hp =15;
hp = max_hp;

// 近战参数
atk1_range  = 50;
atk2_range  = 65;
atk_cool    = 15;   // 共用冷却帧数
atk_timer   = 0;    // 计时器
state       = "IDLE"; // "IDLE" / "ATK1" / "ATK2"

shoot_cd     = 12;    // 200ms 左右
shoot_timer  = 0;


