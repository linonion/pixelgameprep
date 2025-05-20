function scr_take_damage(amount){
	hp -= amount; 
	hurt_cd    = 45;   // 30 帧受击打cd
    flash_step = 0;
	if (hp <= 0) {
		instance_destroy();
	}
}

function scr_spawn_bullet(ent, _spd, _dir) {
    instance_create_layer(
        ent.x, ent.y, "Instances",
        obj_bullet,
        { spd: _spd, dir: _dir, owner_is_player: false }
    );
}


/// obj_boss_song → Script: take_damage

function boss_song_take_damage(amount)
{
    if (hp <= 0) exit;          // 已死无效
    hp -= amount;

    // 停歌（若正在播）
    if (music_id != -1) {
        audio_stop_sound(music_id);
        music_id = -1;
    }

    // 按剩余血量决定对白
    var dlg_file;
    switch (hp) {
        case 2: dlg_file = "boss_song_hit1.txt"; break;
        case 1: dlg_file = "boss_song_hit2.txt"; break;
        case 0: dlg_file = "boss_song_hit3.txt"; break;
    }

    var lines = scr_load_txt(dlg_file);
    instance_create_layer(0,0,"GUI", obj_dialogueBox,
        { lines: lines, speaker:"歌者" });

    dialog_cd = 30;           // 半秒冷却

    // 第 3 次击中 → 死亡
    if (hp <= 0) {
        instance_destroy();
    }
}
