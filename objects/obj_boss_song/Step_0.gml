/// obj_boss_song → Step         // 受击闪白仍生效
event_inherited();


x = 300;
y = 100;
// 冷却计时
if (dialog_cd > 0) dialog_cd--;

// 若有对白框或冷却中，跳过触发检测
if (instance_exists(obj_dialogueBox) || dialog_cd > 0) exit;

// 与玩家距离
if (!instance_exists(obj_player)) exit;
var dist = point_distance(x, y, obj_player.x, obj_player.y);

// 0 → 1：第一次接近，启动歌曲 + 白
if (state == 0 && dist < trigger_dist)
{
    // 旁白
    var lines = scr_load_txt("boss_song_intro.txt");
    instance_create_layer(0,0,"GUI", obj_dialogueBox,
        { lines: lines, speaker:" Someone looks exactly like the one in love" });

    // 播放歌曲（Loop）
    music_id = audio_play_sound(snd_home, 1, true);

    state     = 1;
    dialog_cd = 20;             
}



