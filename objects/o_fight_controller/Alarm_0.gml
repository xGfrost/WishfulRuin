// o_fight_controller - Alarm 0
// Enemy attack selesai
with (o_player_soul) instance_destroy();
with (o_enemy_bullet) instance_destroy();
with (o_enemy_bullet_2) instance_destroy();
with (o_enemy_bullet_3) instance_destroy();
with (o_enemy_bullet_4) instance_destroy();  // TAMBAH INI
battle_state = "menu";

// Ganti round (loop 1-4)
current_round++;
if (current_round > 4) current_round = 1;  // GANTI dari 3 jadi 4