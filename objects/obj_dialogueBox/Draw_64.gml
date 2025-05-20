/// obj_dialogueBox → Draw GUI  (最终版：框不抖动、不覆盖)

// ── GUI 区域尺寸 ───────────────────────────
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// ── 基本参数 ──────────────────────────────
var pad   = 8;                    // 外边距
var max_w = gw - pad * 2;         // 正文行宽上限

// ── 1) 文本准备 ───────────────────────────
var name_txt   = speaker;         // 名字，不带冒号
var full_txt   = lines[index];    // 整句 → 用来算高度
var draw_txt   = string_copy(full_txt, 1, floor(progress)); // 已经打出的部分

// ── 2) 计算高度 (基于完整句，不会跳) ──────
var h_name   = string_height(name_txt);                // 单行高
var tag_h    = h_name + 4;                             // 名字条高度
var h_body   = string_height_ext(full_txt, 0, max_w);  // 正文最大高度
var box_h    = tag_h + h_body + pad * 3 + 10;               // 框总高
var box_y    = gh - box_h;                             // 永贴底

// ── 3) 背景半透明──────────────────────────
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, box_y, gw, gh, false);
draw_set_alpha(1);

// ── 4) 名字标签 (深灰条)────────────────────
var tag_w = string_width(name_txt) + 12;
draw_set_color(make_color_rgb(40,40,40));
draw_rectangle(pad, box_y + pad,
               pad + tag_w, box_y + pad + tag_h, false);

draw_set_color(c_white);
draw_text(pad + 6, box_y + pad + 2, name_txt);

// ── 5) 正文（自动换行，始终自顶向下）──────
draw_set_color(c_white);
draw_text_ext(
    pad,
    box_y + pad + tag_h + pad / 2,
    draw_txt,               // 只画已出现的部分
    10,                      // 行距
    max_w);                 // 最大行宽
