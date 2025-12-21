// Script: start_enemy_attack
function start_enemy_attack() {
    battle_state = "enemy_attack";
    
    // Update box position
    var gui_center_x = display_get_gui_width() / 2;
    var gui_center_y = display_get_gui_height() / 2;
    
    box_x = gui_center_x - box_width/2;
    box_y = gui_center_y - box_height/2 - 50;
    
    // Spawn player soul
    var soul_x = box_x + box_width/2;
    var soul_y = box_y + box_height/2;
    instance_create_depth(soul_x, soul_y, -100, o_player_soul);
    
    // Reset spawn index
    attack_spawn_index = 0;
    
    // Pilih attack berdasarkan round
    if (current_round == 1) {
        // Round 1: Tinju dari sisi
        alarm[1] = 1;
        alarm[0] = room_speed * 9;
    } 
    else if (current_round == 2) {
        // Round 2: Tangan dari kiri
        alarm[2] = 1;
        alarm[0] = room_speed * 5;
    }
    else if (current_round == 3) {
        // Round 3: Bola mantul
        alarm[3] = 1;
        alarm[0] = room_speed * 8;
    }
    else if (current_round == 4) {
        // Round 4: Hujan ludah
        alarm[4] = 1;
        alarm[0] = room_speed * 6;  // 6 detik
    }
}