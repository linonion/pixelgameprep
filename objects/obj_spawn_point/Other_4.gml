//玩家出生点
var sp = instance_find(obj_spawn_point, 0);
if (sp != noone && instance_exists(obj_player)) {
    with (obj_player) {
        x = sp.x;
        y = sp.y;
    }
}
