/// obj_npc_parent → Collision with obj_player
//
// 依赖字段：都在子类 Create 或 Hub 控制器里填好
// level_id      : 0 / 1 / 2
// status        : -1=未解锁, 0=已解锁未通关, 1=已通关
// dialogue_file : "npc0.txt"  等
// speaker_name  : 对话框显示名
//

// ---------- 1. 选对白文件 & target_room ----------
var dlg_file;
var tgt_room = -1;                         // -1 = 对话完留在原房
if (global.dialog_cd > 0) exit;
switch (status)
{
    case -1:                               // 尚未解锁
        dlg_file = "locked.txt";    // 关卡未解锁文档
        break;

    case 0:                                // 已解锁，可进关
        dlg_file = dialogue_file;          // npcX.txt
        tgt_room = global.rm_level_array[level_id];   // rm_level_npcX
        break;

    case 1:                                // 已通关，thanks_x.txt
        dlg_file = "thanks_" + string(level_id) + ".txt";
        break;
}

// ---------- 2. 生成对话框（若屏幕上还没有） ----------
if (!instance_exists(obj_dialogueBox))
{
    var lines = scr_load_txt(dlg_file);

    instance_create_layer(0, 0, "GUI", obj_dialogueBox,
        { lines: lines,
          speaker: speaker_name,
          target_room: tgt_room });        // -1 时对话完不切房
}


