// 1 给玩家武器
other.has_weapon = true;

// 2 弹对白框
if (!instance_exists(obj_dialogueBox))
{
    var lines = scr_load_txt("npc0_collectible.txt");
    instance_create_layer(0,0,"GUI", obj_dialogueBox,
        { lines: lines, speaker: "npc0 precious memory" });
}

// 3 播音效 / 粒子（可选）
// audio_play_sound(snd_pickup,0,false);

// 4 删除自身
instance_destroy();
