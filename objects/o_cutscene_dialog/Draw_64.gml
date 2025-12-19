// o_cutscene_dialog - Draw GUI Event

if (!dialog_active) exit;

// Draw semi-transparent overlay
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, 1366, 768, false);
draw_set_alpha(1);

// Draw dialog box
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

// Draw box border
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);
draw_rectangle(box_x + 2, box_y + 2, box_x + box_width - 2, box_y + box_height - 2, true);

// PAKSA TEXT ALIGNMENT JADI LEFT
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw speaker name
draw_set_font(font_dialog);
draw_set_color(c_yellow);
draw_text(box_x + padding, box_y + 20, dialog_speaker + ":");

// Draw dialog text
var display_text = string_copy(dialog_text, 1, floor(typed_len));
draw_set_font(font_dialog);
draw_set_color(c_white);
draw_text_ext(box_x + padding, box_y + 55, display_text, 22, box_width - (padding * 2));

// Draw continue indicator
if (typed_len >= string_length(dialog_text)) {
    draw_set_halign(fa_right);  // untuk [ENTER] tetap di kanan
    draw_set_font(font_dialog);
    draw_set_color(c_white);
    draw_text(box_x + box_width - padding, box_y + box_height - 30, "[ENTER]");
}

// RESET ALIGNMENT
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);