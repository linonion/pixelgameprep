// player attack setting
function scr_player_attack(_range, _halfAngle)
{
    //--------------------------------------
    // ① 对敌人
    if (has_weapon)
    with (obj_enemy_parent)
    {
        var dist = point_distance(other.x, other.y, x, y);
        if (dist <= _range)
        {
            var ang_to = point_direction(other.x, other.y, x, y);
            var diff   = angle_difference(other.facing_angle, ang_to);

            if (abs(diff) <= _halfAngle && variable_instance_exists(id,"hp"))
            {
                // ★ 判断是否为唱歌 Boss
                if (object_index == obj_boss_song)
                    boss_song_take_damage(1);     // 调专用脚本
                else
                    scr_take_damage(1);           // 普通敌人走原逻辑
            }
        }
    }

    //--------------------------------------
    // ② 对可破砖
    with (obj_breakable)
    {
        var dist = point_distance(other.x, other.y, x, y);
        if (dist <= _range)
        {
            var ang_to = point_direction(other.x, other.y, x, y);
            var diff   = angle_difference(other.facing_angle, ang_to);

            if (abs(diff) <= _halfAngle)
                instance_destroy();
        }
    }
}
