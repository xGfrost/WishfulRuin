// o_player_soul - Create Event
sprite_index = Sprite_Player_Soul;
move_speed = 5;

// Batasan movement (dalam battle box)
box_left = o_fight_controller.box_x + 15;   // Kurangi padding
box_right = o_fight_controller.box_x + o_fight_controller.box_width - 15;
box_top = o_fight_controller.box_y + 15;
box_bottom = o_fight_controller.box_y + o_fight_controller.box_height - 15;