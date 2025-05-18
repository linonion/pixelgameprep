/// obj_tut_controller → Alarm 0
if (!variable_global_exists("tut_intro_done") || !global.tut_intro_done)
{
    global.tut_intro_done = true;                             // 只播一次

    var lines = scr_load_txt("tutorial_intro.txt");    
    instance_create_layer(0, 0, "GUI", obj_dialogueBox,
        { lines: lines, speaker: "", target_room: -1 });
}

instance_destroy();   // 用完即自毁
