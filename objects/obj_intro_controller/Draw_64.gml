if (state == 3)
{
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(gw * 0.5, gh * 0.8, "▶ Press Space and welcome your death");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
