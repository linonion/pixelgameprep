/// obj_npc_parent → Create
// 子类可覆盖 level_id / dialogue_file
level_id      = -1;                 // 0,1,2…
dialogue_file = "";                 // npc0.txt"
status        = global.level_cleared[level_id];                 // -1=未解锁，0=可进入，1=已通关
locked        = true;               // 兼容旧字段
