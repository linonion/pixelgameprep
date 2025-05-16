/// obj_dialogueBox → Draw GUI  （替换成下面）

// GUI 区域大小（＝当前窗口 / Canvas）
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// 对话框尺寸
var box_h = 48;
var box_y = gh - box_h;          // 永远贴 GUI 的底边
var box_x = 0;                   // 横向从最左到最右

// 当前可见文字
var txt_show = string_copy(lines[index], 1, floor(progress));

// 背景半透明条
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(box_x, box_y, gw, gh, false);
draw_set_alpha(1);

// 文字
draw_set_color(c_white);
draw_text(box_x + 8, box_y + 4,  speaker + "：");
draw_text(box_x + 8, box_y + 20, txt_show);
