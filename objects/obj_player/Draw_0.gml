/// obj_player → Draw  (调试可视化；做完可删)

// 半透明淡黄色圆圈表示两个攻击半径
draw_set_alpha(0.25);
draw_set_color(c_yellow);

draw_circle(x, y, atk1_range, false);   // 短攻击范围
draw_circle(x, y, atk2_range, false);   // 长攻击范围

// 恢复默认
draw_set_alpha(1);
draw_set_color(c_white);

draw_self();