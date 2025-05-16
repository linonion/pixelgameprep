// ------------ 全局常量 ------------
global.level_total    = 3;                                 // 关卡总数
global.level_cleared  = [ 0, -1, -1 ];                     // 关卡解锁情况，0解锁 -1没解锁
global.npc_list       = [ obj_npc0, obj_npc1, obj_npc2 ];  // Hub 里的 NPC 顺序
global.rm_level_array = [ rm_level_npc0,
                          rm_level_npc1,
                          rm_level_npc2 ];                 // 关卡房间顺序

global.current_level  = 0;                                // 进关时写 0/1/2
