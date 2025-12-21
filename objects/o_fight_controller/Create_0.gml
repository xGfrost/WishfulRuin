// o_fight_controller - Create Event

// Player stats
player_hp = 20;
player_hp_max = 20;

// Enemy stats
enemy_name = "Bagas";
enemy_hp = 30;
enemy_hp_max = 30;

// Battle state
battle_state = "menu"; // "menu", "fight_bar", "item_select", "act_select", "enemy_attack", "enemy_select"
menu_selection = 0; // 0=FIGHT, 1=ITEM, 2=ACT

// Menu positions
menu_options = ["FIGHT", "ITEM", "ACT"];
menu_x = 320;
menu_y = 600;
menu_spacing = 150;

// Battle box (untuk enemy attack phase)
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

// Enemy list (untuk FIGHT submenu)
enemy_list = ["Bagas"];
enemy_selection = 0;

// Round system
current_round = 1; // 1-2 (nanti 1-4)
act_count = 0;
act_needed = 4;

// Attack spawn counter
attack_spawn_index = 0;

// Dialog box untuk submenu (DEKAT HP)
dialog_box_x = 200;
dialog_box_y = 460;
dialog_box_width = 966;
dialog_box_height = 120;