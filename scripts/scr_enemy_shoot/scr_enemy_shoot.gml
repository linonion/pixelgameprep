// 子弹typle待test
function scr_enemy_shoot(ent) {
ent.ring_angle = (variable_instance_exists(ent.id, "ring_angle") ? ent.ring_angle : 0) + 10;
    switch (ent.shoot_type) {

        case SHOOT_TYPE.NONE:
            break;

        case SHOOT_TYPE.RING:
            for (var a = 0; a < 360; a += 30) {
                scr_spawn_bullet(ent, 2, a + ent.ring_angle);
            }
            break;

        case SHOOT_TYPE.FAN:
            for (var a = -30; a <= 30; a += 15) {
                scr_spawn_bullet(ent, 3, ent.direction + a);
            }
            break;

        case SHOOT_TYPE.TOWARD_PLAYER:
            var tar = instance_nearest(ent.x, ent.y, obj_player);
            if (tar != noone && point_distance(ent.x, ent.y, tar.x, tar.y) < ent.det_radius) {
                var ang = point_direction(ent.x, ent.y, tar.x, tar.y);
                scr_spawn_bullet(ent, 4, ang);
            }
            break;

        case SHOOT_TYPE.SPIRAL:
            ent.spiral_angle = (variable_instance_exists(ent.id,"spiral_angle") ? ent.spiral_angle : 0) + 15;
            scr_spawn_bullet(ent, 3, ent.spiral_angle);
            break;
    }
}
