if (!can_move) {
    sprite_index = adam_idle_walk_up_sekolah; // atau idle sesuai last_direction
    image_speed = 0;
    exit; // Stop semua movement
}

// Adam Baju Sekolah - WASD + Arrow Keys dengan Idle + Collision
var is_moving = false; // Track apakah player bergerak

// Walk Down (S atau Panah Bawah)
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    // Cek collision sebelum gerak
    if (!place_meeting(x, y + move_speed, Object_Bagas_Bully)) {
        sprite_index = adam_sprites_walk_down_sekolah;
        image_speed = 1.2;
        y += move_speed;
        is_moving = true;
    }
    last_direction = "down";
}
// Walk Up (W atau Panah Atas)
else if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    // Cek collision sebelum gerak
    if (!place_meeting(x, y - move_speed, Object_Bagas_Bully)) {
        sprite_index = adam_sprites_walk_up_sekolah;
        image_speed = 1.2;
        y -= move_speed;
        is_moving = true;
    }
    last_direction = "up";
}
// Walk Left (A atau Panah Kiri)
else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    // Cek collision sebelum gerak
    if (!place_meeting(x - move_speed, y, Object_Bagas_Bully)) {
        sprite_index = adam_sprites_walk_left_sekolah;
        image_speed = 1.2;
        x -= move_speed;
        is_moving = true;
    }
    last_direction = "left";
}
// Walk Right (D atau Panah Kanan)
else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    // Cek collision sebelum gerak
    if (!place_meeting(x + move_speed, y, Object_Bagas_Bully)) {
        sprite_index = adam_sprites_walk_right_sekolah;
        image_speed = 1.2;
        x += move_speed;
        is_moving = true;
    }
    last_direction = "right";
}

// Idle (tidak pencet tombol apapun)
if (!is_moving) {
    image_speed = 0; // Stop animasi
    
    // Ganti ke sprite idle sesuai arah terakhir
    switch(last_direction) {
        case "down":
            sprite_index = adam_idle_walk_down_sekolah;
            break;
        case "up":
            sprite_index = adam_idle_walk_up_sekolah;
            break;
        case "left":
            sprite_index = adam_idle_walk_left_sekolah;
            break;
        case "right":
            sprite_index = adam_idle_walk_right_sekolah;
            break;
    }
}
