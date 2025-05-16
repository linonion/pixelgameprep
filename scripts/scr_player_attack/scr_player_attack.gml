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
                scr_take_damage(1);
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
