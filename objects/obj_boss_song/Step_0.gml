/// obj_boss_song → Step   （完整替换）

event_inherited();      // 闪白硬直仍生效

// 永远固定位置
x = 300;
y = 100;

// ── 冷却计数 ─────────────────────────────
if (dialog_cd > 0) dialog_cd--;

// ── 如需续播歌：对白结束 & CD=0 时启动循环 ─
if (music_resume && !instance_exists(obj_dialogueBox) && dialog_cd == 0)
{
    music_id     = audio_play_sound(song_sound, 1, true);  // loop
    music_resume = false;
}

// ── 若对白框存在或 CD>0，则不再检测距离 ──
if (instance_exists(obj_dialogueBox) || dialog_cd > 0) exit;

// ── 与玩家距离检测 ───────────────────────
if (!instance_exists(obj_player)) exit;
var dist = point_distance(x, y, obj_player.x, obj_player.y);

// 第一次接近 → Intro对白 + 开始唱歌
if (state == 0 && dist < trigger_dist)
{
    instance_create_layer(
        0,0,"GUI", obj_dialogueBox,
        { lines: scr_load_txt("boss_song_intro.txt"),
          speaker: "歌者" });

    music_id  = audio_play_sound(song_sound, 1, true); // loop
    state     = 1;
    dialog_cd = 20;           // 冷却⅓秒
}


