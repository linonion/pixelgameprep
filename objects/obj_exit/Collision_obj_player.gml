/// obj_exit → Collision with obj_player

var curr_id = level_id;                   // 从创建时附带的 struct 得到
global.level_cleared[level_id] = 1;        // 标记本关已通关
global.current_level += 1;

// 解锁下一关
if (curr_id + 1 < global.level_total && global.level_cleared[curr_id+1] == -1)
    global.level_cleared[curr_id+1] = 0;

var lines = scr_load_txt("clear_" + string(curr_id + 1) + ".txt");

instance_create_layer(0, 0, "GUI", obj_dialogueBox,
    { lines: lines, speaker: "系统", target_room: rm_hub });

// 让玩家不会被后续逻辑再次触发
instance_destroy();
