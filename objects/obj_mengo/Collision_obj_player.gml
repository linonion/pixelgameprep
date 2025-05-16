/// obj_mengpo → Collision

if (instance_exists(obj_dialogueBox)) exit;   // 避免多开

var dlg_file;

// ① 最先判断 intro
if (!global.mengpo_intro_done)
{
    dlg_file = "mengpo_intro.txt";
    global.mengpo_intro_done = true;
}
else
{
    // ② 按当前通关进度判断一次性对话
    if (global.level_cleared[2] == 1 && !global.mengpo_after2_done)
    {
        dlg_file = "mengpo_after2.txt";
        global.mengpo_after2_done = true;
    }
    else if (global.level_cleared[1] == 1 && !global.mengpo_after1_done)
    {
        dlg_file = "mengpo_after1.txt";
        global.mengpo_after1_done = true;
    }
    else if (global.level_cleared[0] == 1 && !global.mengpo_after0_done)
    {
        dlg_file = "mengpo_after0.txt";
        global.mengpo_after0_done = true;
    }
    else
    {
        // ③ 普通情况下：随机挑一句
        var rand_lines = scr_load_txt("mengpo_random.txt");
        dlg_file      = "";                             // 不用外部文件
    }
}

// ④ 生成对白框
var lines;
if (dlg_file != "")
{
    lines = scr_load_txt(dlg_file);
}
else
{
    // 随机对白文件：rand_lines 已在上面取到
    var rnd = irandom(array_length(rand_lines)-1);
    lines = [ rand_lines[rnd] ];
}

instance_create_layer(0,0,"GUI", obj_dialogueBox,
    { lines: lines, speaker: speaker_name, target_room: -1 });
