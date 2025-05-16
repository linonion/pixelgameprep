// 1) 运动
scr_enemy_move(id);

// 2) 计时射击
if (--shoot_timer <= 0) {
    scr_enemy_shoot(id);
    shoot_timer = shoot_cd;
}
