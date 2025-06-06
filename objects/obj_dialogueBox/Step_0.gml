/// obj_dialogueBox → Step

// ── 打字推进 ──────────────────────────────
progress += spd;

// sound: 每出现新字符 → 播放一次音效
var cur_char = floor(progress);
if (cur_char > last_char && cur_char <= string_length(lines[index]))
{
    audio_play_sound(snd_type, 0, false);
    last_char = cur_char;
}

// ── 空格推进行 / 结束切房 ────────────────
if (keyboard_check_pressed(vk_space) && progress >= string_length(lines[index]))
{
    index++;
    if (index >= array_length(lines))   // 全部对白播完
    {
        if (target_room != -1) room_goto(target_room);
        instance_destroy();
    }
    else {
        progress  = 0;
        last_char = 0;
    }
}
