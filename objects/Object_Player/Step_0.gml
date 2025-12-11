// Adam Baju Sekolah - WASD + Arrow Keys dengan Idle

var is_moving = false; // Track apakah player bergerak

// Walk Down (S atau Panah Bawah)
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    sprite_index = adam_sprites_walk_down_sekolah; // Walk sprite
    image_speed = 1.2; // Animasi jalan
    y += move_speed;
    is_moving = true;
    last_direction = "down";
}
// Walk Up (W atau Panah Atas)
else if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    sprite_index = adam_sprites_walk_up_sekolah; // Walk sprite
    image_speed = 1.2;
    y -= move_speed;
    is_moving = true;
    last_direction = "up";
}
// Walk Left (A atau Panah Kiri)
else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    sprite_index = adam_sprites_walk_left_sekolah; // Walk sprite
    image_speed = 1.2;
    x -= move_speed;
    is_moving = true;
    last_direction = "left";
}
// Walk Right (D atau Panah Kanan)
else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    sprite_index = adam_sprites_walk_right_sekolah; // Walk sprite
    image_speed = 1.2;
    x += move_speed;
    is_moving = true;
    last_direction = "right";
}

// Idle (tidak pencet tombol apapun)
if (!is_moving) {
    image_speed = 0; // Stop animasi
    
    // Ganti ke sprite idle sesuai arah terakhir
    switch(last_direction) {
        case "down":
            sprite_index = adam_idle_walk_down_sekolah; // Idle sprite
            break;
        case "up":
            sprite_index = adam_idle_walk_up_sekolah; // Idle sprite
            break;
        case "left":
            sprite_index = adam_idle_walk_left_sekolah; // Idle sprite
            break;
        case "right":
            sprite_index = adam_idle_walk_right_sekolah; // Idle sprite
            break;
    }
}
