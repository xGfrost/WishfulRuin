// o_prolog – Draw Event

// Background hitam
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Titik tengah layar
var cx = room_width * 0.5;

// ------------ JUDUL ------------
draw_set_font(font_title);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

var title_y = room_height * 0.18;
draw_text(cx, title_y, title[page]);

// ------------ TEKS CERITA ------------
draw_set_font(font_body);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var text_y = room_height * 0.35;
var wrap_w = room_width * 0.8; // lebar paragraf (80% lebar layar)

// pakai display_text supaya typewriter jalan
draw_text_ext(cx, text_y, display_text, 32, wrap_w);

// ------------ HINT "ENTER" ------------
if (typed_len >= string_length(body[page])) {
    draw_set_font(font_body);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_gray);

    draw_text(cx, room_height * 0.92, "[ENTER / CLICK UNTUK LANJUT]");
}
