// o_fight_controller - Alarm 3
// Spawn bola mantul dari atas (Round 3)

// STOP kalau sudah bukan enemy_attack state
if (battle_state != "enemy_attack") {
    exit;
}

// Spawn 4 bola: 2 ke kiri, 2 ke kanan
if (attack_spawn_index < 4) {
    var spawn_y = box_y - 30;  // Dari atas box
    var spawn_x;
    var ball_direction;
    var ball_speed = 3;
    
    // Bagi box jadi 4 section horizontal
    var section_width = box_width / 4;
    
    // Tentukan posisi X dan arah
    switch(attack_spawn_index) {
        case 0:  // Bola 1: kiri, arah diagonal kiri-bawah
            spawn_x = box_x + section_width * 0.5;
            ball_direction = 225;  // Diagonal kiri-bawah
            break;
        case 1:  // Bola 2: kiri-tengah, arah diagonal kanan-bawah
            spawn_x = box_x + section_width * 1.5;
            ball_direction = 315;  // Diagonal kanan-bawah
            break;
        case 2:  // Bola 3: kanan-tengah, arah diagonal kiri-bawah
            spawn_x = box_x + section_width * 2.5;
            ball_direction = 225;  // Diagonal kiri-bawah
            break;
        case 3:  // Bola 4: kanan, arah diagonal kanan-bawah
            spawn_x = box_x + section_width * 3.5;
            ball_direction = 315;  // Diagonal kanan-bawah
            break;
    }
    
    // Spawn bola
    var bullet = instance_create_depth(spawn_x, spawn_y, -50, o_enemy_bullet_3);
    bullet.direction = ball_direction;
    bullet.speed = ball_speed;
    
    attack_spawn_index++;
    alarm[3] = room_speed * 0.5;  // 0.5 detik per bola
} else {
    // Setelah 4 bola pertama, tidak spawn lagi
    // (bola akan terus bounce sampai round selesai)
}