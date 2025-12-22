// o_fight_controller - Create Event

// Player stats
player_hp = 20;
player_hp_max = 20;

// Enemy stats
enemy_name = "Bagas";
enemy_hp = 30;
enemy_hp_max = 30;

// Battle state
battle_state = "menu";
menu_selection = 0;

// Menu positions
menu_options = ["FIGHT", "ITEM", "ACT"];
menu_x = 320;
menu_y = 600;
menu_spacing = 150;

// Battle box
box_width = 200;
box_height = 200;
box_x = (1366 / 2) - (box_width / 2);
box_y = (768 / 2) - (box_height / 2) - 50;

// Fight bar settings
fight_bar_x = 400;
fight_bar_speed = 8;
fight_bar_direction = 1;
fight_bar_active = false;

// Items (KOSONG DULU)
inventory = [];
item_selection = 0;

// ACT options
act_options = ["Menghindar"];
act_selection = 0;

// Enemy list
enemy_list = ["Bagas"];
enemy_selection = 0;

// Round system
current_round = 1;
act_count = 0;
act_needed = 4;

// Attack spawn counter
attack_spawn_index = 0;

// Dialog box untuk submenu
dialog_box_x = 200;
dialog_box_y = 460;
dialog_box_width = 966;
dialog_box_height = 120;

// Play BGM fight (loop sampai fight selesai)
audio_stop_all();
bgm_fight = audio_play_sound(Fight_Theme, 1, true);
