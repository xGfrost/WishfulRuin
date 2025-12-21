// o_enemy_bullet - Create Event
sprite_index = Sprites_Bagas_Attack_1;

// Arah menuju tengah box
target_x = o_fight_controller.box_x + o_fight_controller.box_width / 2;
target_y = o_fight_controller.box_y + o_fight_controller.box_height / 2;

// Hitung arah
direction = point_direction(x, y, target_x, target_y);
speed = 4;

// Rotate sprite menghadap arah gerakan
// Kalau sprite default menghadap ATAS (90 derajat), kurangi 90
image_angle = direction - 90;  // GANTI INI

// Damage
damage_amount = 3;