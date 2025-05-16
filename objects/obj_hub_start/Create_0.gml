// ------------ 全局常量 / 容器 ------------
global.level_total    = 3;                                 // 目前 3 关
global.level_cleared  = [ 0, -1, -1 ];                     // 0号关已解锁
global.npc_list       = [ obj_npc0, obj_npc1, obj_npc2 ];  // Hub 里的 NPC 顺序
global.rm_level_array = [ rm_level_npc0,
                          rm_level_npc1,
                          rm_level_npc2 ];                 // 关卡房间顺序

global.current_level  = 0;                                // 进关时再写 0/1/2
