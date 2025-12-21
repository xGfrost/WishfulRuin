// o_fight_controller - Alarm 1
// Spawn tinju dari 8 posisi

if (attack_spawn_index < 8) {
    var spawn_x, spawn_y;
    
    switch(attack_spawn_index) {
        case 0: // Atas tengah
            spawn_x = box_x + box_width / 2;
            spawn_y = box_y - 40;  // Lebih jauh dari box
            break;
        case 1: // Kanan tengah
            spawn_x = box_x + box_width + 40;
            spawn_y = box_y + box_height / 2;
            break;
        case 2: // Bawah tengah
            spawn_x = box_x + box_width / 2;
            spawn_y = box_y + box_height + 40;
            break;
        case 3: // Kiri tengah
            spawn_x = box_x - 40;
            spawn_y = box_y + box_height / 2;
            break;
        case 4: // Sudut kanan atas
            spawn_x = box_x + box_width + 40;
            spawn_y = box_y - 40;
            break;
        case 5: // Sudut kanan bawah
            spawn_x = box_x + box_width + 40;
            spawn_y = box_y + box_height + 40;
            break;
        case 6: // Sudut kiri bawah
            spawn_x = box_x - 40;
            spawn_y = box_y + box_height + 40;
            break;
        case 7: // Sudut kiri atas
            spawn_x = box_x - 40;
            spawn_y = box_y - 40;
            break;
    }
    
    // Spawn bullet
    instance_create_depth(spawn_x, spawn_y, -50, o_enemy_bullet);
    
    attack_spawn_index++;
    alarm[1] = room_speed * 1; // Spawn lagi 1 detik kemudian
}