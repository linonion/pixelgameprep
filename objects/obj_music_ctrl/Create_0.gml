
if (!variable_instance_exists(id, "want_music"))
{
    show_debug_message("⚠ obj_music_ctrl 没设置 want_music！");
    want_music = noone;
}

if (variable_global_exists("current_music_id") && global.current_music_id != -1)
{
    audio_stop_sound(global.current_music_id);
}

if (want_music != noone)
{
    global.current_music_id = audio_play_sound(want_music, 1, true);
}
else
{
    global.current_music_id = -1;
}
