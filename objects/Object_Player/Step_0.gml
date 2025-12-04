if (keyboard_check(vk_down)) {
    sprite_index = adam_sprites_walk_down;
    image_speed = 0.3;
    y += move_speed;
}
else {
    image_speed = 0;
}