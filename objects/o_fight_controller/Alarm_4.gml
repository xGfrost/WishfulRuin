// o_fight_controller - Alarm 4
// Spawn ludah hujan dari atas (Round 4)

// STOP kalau sudah bukan enemy_attack state
if (battle_state != "enemy_attack") {
    exit;
}

// Spawn ludah dari posisi random di atas box
var spawn_x = box_x + random(box_width);  // Random horizontal
var spawn_y = box_y - 30;  // Dari atas box

// Spawn bullet Round 4
instance_create_depth(spawn_x, spawn_y, -50, o_enemy_bullet_4);

attack_spawn_index++;

// Delay: 0.25 detik per ludah (hujan cepat!)
alarm[4] = room_speed * 0.25;

// Loop terus sampai round selesai