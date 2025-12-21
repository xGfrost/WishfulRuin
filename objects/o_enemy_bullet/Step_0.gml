// o_enemy_bullet - Step Event

// Collision dengan soul player
if (place_meeting(x, y, o_player_soul)) {
    with (o_fight_controller) {
        player_hp -= other.damage_amount;
        
        // Cek game over
        if (player_hp <= 0) {
            player_hp = 0;
            with (o_player_soul) instance_destroy();
            with (o_enemy_bullet) instance_destroy();
            show_message("You died!");
            room_goto(Class_Room);
        }
    }
    instance_destroy();
}

// Destroy kalau MELEWATI garis battle box (toleransi lebih besar)
var box_left = o_fight_controller.box_x;
var box_right = o_fight_controller.box_x + o_fight_controller.box_width;
var box_top = o_fight_controller.box_y;
var box_bottom = o_fight_controller.box_y + o_fight_controller.box_height;

// Destroy kalau keluar jauh dari box
if (x < box_left - 100 || x > box_right + 100 || 
    y < box_top - 100 || y > box_bottom + 100) {
    instance_destroy();
}