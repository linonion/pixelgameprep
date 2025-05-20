speaker_name  = "mengpo";

// 建 4 个全局布尔标志（不存在时才创建）
if (!variable_global_exists("mengpo_intro_done"))
{
    global.mengpo_intro_done   = false;
    global.mengpo_after0_done  = false;
    global.mengpo_after1_done  = false;
    global.mengpo_after2_done  = false;
	global.mengpo_final_done   = false;
}
