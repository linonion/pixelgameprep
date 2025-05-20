// 0) 冷却 & 对白框保护
if (global.dialog_cd > 0 || instance_exists(obj_dialogueBox)) exit;

// ─────────────────────────────────────────
// 1. 全通关检测：level_cleared 全部=1 ?
var all_clear = true;
for (var i = 0; i < array_length(global.level_cleared); i++)
{
    if (global.level_cleared[i] != 1) { all_clear = false; break; }
}

// ─────────────────────────────────────────
// 2. 挑选对白文件 & 是否切房
var dlg_file      = "";
var target_room   = -1;   // -1=留在 Hub
var rand_lines;

/// 2-A 终章（只播一次）
if (all_clear && !global.mengpo_final_done)
{
    dlg_file               = "mengpo_final.txt";
    target_room            = rm_level_mengpo;  // 切最终关
    global.mengpo_final_done = true;
}

/// 2-B 首次 Intro（只播一次）
else if (!global.mengpo_intro_done)
{
    dlg_file = "mengpo_intro.txt";
    global.mengpo_intro_done = true;
}

/// 2-C 通关后一次性对白（倒序方便先判断 2 → 1 → 0）
else if (global.level_cleared[2] == 1 && !global.mengpo_after2_done)
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

/// 2-D 日常随机一句
else
{
    rand_lines = scr_load_txt("mengpo_random.txt");
}

// ─────────────────────────────────────────
// 3. 生成对白框
var lines;
if (dlg_file != "")
{
    lines = scr_load_txt(dlg_file);
}
else
{
    var rnd = irandom(array_length(rand_lines) - 1);
    lines   = [ rand_lines[rnd] ];
}

// 创建对白框，target_room -1=留 Hub，或 rm_level_mengpo
instance_create_layer(0, 0, "GUI", obj_dialogueBox,
    { lines: lines, speaker: speaker_name,
      target_room: target_room });

// 设置冷却，避免卡位连触
global.dialog_cd = 20;    
