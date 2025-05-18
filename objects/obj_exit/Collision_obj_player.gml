/// obj_exit → Collision with obj_player

var curr_id = level_id;                   // fromt the struct
global.level_cleared[level_id] = 1;        // 标记本关已通关
global.current_level += 1;

// unlock下一关
if (curr_id + 1 < global.level_total && global.level_cleared[curr_id+1] == -1)
    global.level_cleared[curr_id+1] = 0;

var lines = scr_load_txt("clear_" + string(curr_id) + ".txt");

instance_create_layer(0, 0, "GUI", obj_dialogueBox,
    { lines: lines, speaker: "...", target_room: rm_hub });

instance_destroy();
