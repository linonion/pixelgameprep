// 避免歌还在播放
if (music_id != -1) audio_stop_sound(music_id);

// 生成出口
instance_create_layer(320,180,"Instances", obj_exit,
    { level_id: global.current_level });
