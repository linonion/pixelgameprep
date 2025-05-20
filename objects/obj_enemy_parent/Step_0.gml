// ── 受击硬直 & 闪白 ──────────────────────
if (hurt_cd > 0)
{
    hurt_cd--;

    // 闪白：2 帧亮白 / 2 帧正常
    if (flash_step mod 6 < 2) image_blend = c_white;
    else                      image_blend = -1;
    flash_step++;

    exit;   // ★ 本帧不做移动、射弹等后续逻辑
}
else
{
    image_blend = -1;   // 恢复原色
}

// 1 运动
scr_enemy_move(id);

// 2 计时射击
if (--shoot_timer <= 0) {
    scr_enemy_shoot(id);
    shoot_timer = shoot_cd;
}
