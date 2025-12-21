// o_enemy_bullet_2 - Step Event

// Collision dengan soul player
if (place_meeting(x, y, o_player_soul)) {
    with (o_fight_controller) {
        player_hp -= other.damage_amount;
        
        if (player_hp <= 0) {
            player_hp = 0;
            with (o_player_soul) instance_destroy();
            with (o_enemy_bullet) instance_destroy();
            with (o_enemy_bullet_2) instance_destroy();
            show_message("You died!");
            room_goto(Class_Room);
        }
    }
    instance_destroy();
}

// Destroy kalau keluar dari box
var box_left = o_fight_controller.box_x;
var box_right = o_fight_controller.box_x + o_fight_controller.box_width;
var box_top = o_fight_controller.box_y;
var box_bottom = o_fight_controller.box_y + o_fight_controller.box_height;

if (x < box_left - 100 || x > box_right + 100 || 
    y < box_top - 100 || y > box_bottom + 100) {
    instance_destroy();
}