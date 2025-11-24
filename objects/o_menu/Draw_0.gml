// ===== JUDUL GAME =====
draw_set_font(font_main);        // pakai font yang sama dulu
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// judul di atas menu, kira-kira 2x jarak button
draw_text(menu_x, menu_y - button_h * 2, "WISHFUL RAIN");

// ===== DAFTAR MENU =====
var i = 0;
repeat (buttons) {
    draw_set_font(font_main);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_ltgray);

    if (menu_index == i) draw_set_color(c_red);

    draw_text(menu_x, menu_y + button_h * i, button[i]);
    i++;
}
