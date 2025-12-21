// o_enemy_bullet_3 - Step Event

// Collision dengan soul player
if (place_meeting(x, y, o_player_soul)) {
    with (o_fight_controller) {
        player_hp -= other.damage_amount;
        
        if (player_hp <= 0) {
            player_hp = 0;
            with (o_player_soul) instance_destroy();
            with (o_enemy_bullet) instance_destroy();
            with (o_enemy_bullet_2) instance_destroy();
            with (o_enemy_bullet_3) instance_destroy();
            show_message("You died!");
            room_goto(Class_Room);
        }
    }
    instance_destroy();
}

// BOUNCE dari dinding box
var box_left = o_fight_controller.box_x;
var box_right = o_fight_controller.box_x + o_fight_controller.box_width;
var box_top = o_fight_controller.box_y;
var box_bottom = o_fight_controller.box_y + o_fight_controller.box_height;

// Bounce horizontal (kiri-kanan)
if (x <= box_left + 5) {
    x = box_left + 5;
    direction = 180 - direction;  // Reflect horizontal
    bounce_count++;
}
if (x >= box_right - 5) {
    x = box_right - 5;
    direction = 180 - direction;  // Reflect horizontal
    bounce_count++;
}

// Bounce vertical (atas-bawah)
if (y <= box_top + 5) {
    y = box_top + 5;
    direction = 360 - direction;  // Reflect vertical
    bounce_count++;
}
if (y >= box_bottom - 5) {
    y = box_bottom - 5;
    direction = 360 - direction;  // Reflect vertical
    bounce_count++;
}

// Destroy setelah banyak bounce (opsional)
if (bounce_count >= max_bounces) {
    instance_destroy();
}

// Destroy kalau keluar jauh dari box (backup)
if (x < box_left - 50 || x > box_right + 50 || 
    y < box_top - 50 || y > box_bottom + 50) {
    instance_destroy();
}