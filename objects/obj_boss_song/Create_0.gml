event_inherited();
max_hp     = 3;
hp         = max_hp;
depth = -100;  // Create 里

move_type  = MOVE_TYPE.STAY;
shoot_type = SHOOT_TYPE.NONE; 

state       = 0;          // 0 待触发，1 正在唱歌
music_id    = -1;         // 播放中的声音句柄
dialog_cd   = 0;          // 防止对白连发
trigger_dist = 96;        // 首次触发距离



sprite_index = spr_npc3_enemey;   
image_speed  = 0;               // 不自动播放动画
image_alpha  = 1;               // 100% 不透明
image_blend  = -1;              // 原色
visible      = true;
depth        = -1000;           // 比 Tile 层浅，确保在最上

music_resume  = false;   // 是否要在对白完回放歌曲
song_sound    = snd_home;   
