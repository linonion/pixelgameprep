/// obj_player → Draw  (调试；做完删)

draw_set_alpha(0.25);
draw_set_color(c_yellow);

draw_circle(x, y, atk1_range, false);   // 短攻击范围
draw_circle(x, y, atk2_range, false);   // 长攻击范围

draw_set_alpha(1);
draw_set_color(c_white);

/// 无敌帧效果

/// 闪烁覆盖整个无敌帧，不太明显可再修改

if (hurt_cd > 0)
{
    // 每 3 帧切换一次：0 1 2 = 亮白；3 4 5 = 正常
    if (flash_step mod 6 < 3) {
        image_blend = c_white;     // 亮
    } else {
        image_blend = -1;          // 恢复本色
    }
    flash_step++;                  
}
else
{
    image_blend = -1;              // 无敌结束确保复原
    flash_step  = 0;               // 计数归零，便于下次
}



draw_self();