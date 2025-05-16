/// obj_player → Draw  (调试；做完删)

draw_set_alpha(0.25);
draw_set_color(c_yellow);

draw_circle(x, y, atk1_range, false);   // 短攻击范围
draw_circle(x, y, atk2_range, false);   // 长攻击范围

draw_set_alpha(1);
draw_set_color(c_white);

draw_self();