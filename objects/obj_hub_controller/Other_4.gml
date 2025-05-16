/// obj_hub_controller → Room Start  
for (var i = 0; i < global.level_total; i++)
{
    var npc_obj = global.npc_list[i];
    if (!instance_exists(npc_obj)) continue;

    var npc = instance_find(npc_obj, 0);
    npc.status = global.level_cleared[i];   // -1 / 0 / 1
    npc.visible = true;                     // 始终可见
}


with (obj_player)
{
    has_weapon = false;
    x = 320; y = 180;
}
