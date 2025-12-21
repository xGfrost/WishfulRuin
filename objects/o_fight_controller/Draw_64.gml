// o_fight_controller - Draw GUI Event

// Set alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_dialog);

var gui_center_x = display_get_gui_width() / 2;
var gui_center_y = display_get_gui_height() / 2;

switch(battle_state) {
    case "menu":
    case "fight_bar":
    case "item_select":
    case "act_select":
    case "enemy_select":
        // Draw enemy info (TENGAH ATAS)
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text(gui_center_x, 50, enemy_name);
        
        // Enemy HP bar (TENGAH)
        var hp_bar_width = 200;
        draw_healthbar(gui_center_x - hp_bar_width/2, 80, gui_center_x + hp_bar_width/2, 100, 
                       (enemy_hp / enemy_hp_max) * 100, c_black, c_red, c_lime, 0, true, true);
        
        // Player HP (TENGAH BAWAH)
        draw_set_halign(fa_left);
        var hp_x = gui_center_x - 150;
        var hp_y = gui_center_y + 250;
        
        draw_text(hp_x, hp_y, "HP");
        draw_healthbar(hp_x + 60, hp_y + 5, hp_x + 260, hp_y + 25, 
                       (player_hp / player_hp_max) * 100, c_black, c_red, c_yellow, 0, true, true);
        draw_text(hp_x + 280, hp_y + 5, string(player_hp) + " / " + string(player_hp_max));
        
        break;
        
    case "enemy_attack":
        // Draw battle box (TENGAH)
        draw_set_color(c_white);
        draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);
        draw_rectangle(box_x + 2, box_y + 2, box_x + box_width - 2, box_y + box_height - 2, true);
        
        // Player HP
        draw_set_halign(fa_left);
        var hp_x = gui_center_x - 150;
        var hp_y = gui_center_y + 250;
        
        draw_text(hp_x, hp_y, "HP");
        draw_healthbar(hp_x + 60, hp_y + 5, hp_x + 260, hp_y + 25, 
                       (player_hp / player_hp_max) * 100, c_black, c_red, c_yellow, 0, true, true);
        draw_text(hp_x + 280, hp_y + 5, string(player_hp) + " / " + string(player_hp_max));
        break;
}

// Draw menu (TENGAH BAWAH) - HANYA SAAT MENU
if (battle_state == "menu") {
    var menu_start_x = gui_center_x - (menu_spacing * array_length(menu_options) / 2) + 50;
    var menu_y_pos = gui_center_y + 300;
    
    for (var i = 0; i < array_length(menu_options); i++) {
        draw_set_halign(fa_left);
        if (i == menu_selection) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        
        draw_text(menu_start_x + (i * menu_spacing), menu_y_pos, menu_options[i]);
    }
}

// Draw fight bar (TENGAH)
if (battle_state == "fight_bar" && fight_bar_active) {
    var bar_x1 = gui_center_x - 250;
    var bar_x2 = gui_center_x + 250;
    var bar_y = gui_center_y + 150;
    
    // Bar background
    draw_set_color(c_white);
    draw_rectangle(bar_x1, bar_y, bar_x2, bar_y + 30, true);
    
    // Target zone (tengah)
    draw_set_color(c_green);
    draw_rectangle(gui_center_x - 30, bar_y, gui_center_x + 30, bar_y + 30, false);
    
    // Moving indicator
    draw_set_color(c_red);
    draw_rectangle(fight_bar_x - 10, bar_y - 5, fight_bar_x + 10, bar_y + 35, false);
}

// ========== SUBMENU DIALOG BOXES ==========

// Draw enemy select submenu (setelah pilih FIGHT)
if (battle_state == "enemy_select") {
    // Draw dialog box
    draw_set_color(c_black);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, false);
    draw_set_color(c_white);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, true);
    draw_rectangle(dialog_box_x + 2, dialog_box_y + 2, dialog_box_x + dialog_box_width - 2, dialog_box_y + dialog_box_height - 2, true);
    
    // Draw enemy list (KIRI ATAS)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow);
    draw_text(dialog_box_x + 50, dialog_box_y + 30, "* " + enemy_list[enemy_selection]);
}

// Draw item select submenu
if (battle_state == "item_select") {
    // Draw dialog box
    draw_set_color(c_black);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, false);
    draw_set_color(c_white);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, true);
    draw_rectangle(dialog_box_x + 2, dialog_box_y + 2, dialog_box_x + dialog_box_width - 2, dialog_box_y + dialog_box_height - 2, true);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    if (array_length(inventory) == 0) {
        // Tidak ada item (KIRI ATAS)
        draw_set_color(c_white);
        draw_text(dialog_box_x + 50, dialog_box_y + 30, "Tidak ada Item");
    } else {
        // Ada item, tampilkan list (KIRI ATAS)
        for (var i = 0; i < array_length(inventory); i++) {
            if (i == item_selection) draw_set_color(c_yellow);
            else draw_set_color(c_white);
            
            draw_text(dialog_box_x + 50, dialog_box_y + 30 + (i * 30), "* " + inventory[i][0] + " (+" + string(inventory[i][1]) + " HP)");
        }
    }
}

// Draw ACT select submenu
if (battle_state == "act_select") {
    // Draw dialog box
    draw_set_color(c_black);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, false);
    draw_set_color(c_white);
    draw_rectangle(dialog_box_x, dialog_box_y, dialog_box_x + dialog_box_width, dialog_box_y + dialog_box_height, true);
    draw_rectangle(dialog_box_x + 2, dialog_box_y + 2, dialog_box_x + dialog_box_width - 2, dialog_box_y + dialog_box_height - 2, true);
    
    // Draw ACT options (KIRI ATAS)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    for (var i = 0; i < array_length(act_options); i++) {
        if (i == act_selection) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        
        draw_text(dialog_box_x + 50, dialog_box_y + 30 + (i * 30), "* " + act_options[i]);
    }
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);