// o_fight_controller - Alarm 2
// Spawn 2 tangan per baris (kiri & kanan) dengan celah di tengah

// STOP kalau sudah bukan enemy_attack state
if (battle_state != "enemy_attack") {
    exit;  // Berhenti spawn
}

var total_rows = 6;  // 6 baris
var row_spacing = box_height / (total_rows + 1);  // Spacing antar baris

// Hitung baris dan kolom
var row = floor(attack_spawn_index / 2);  // 2 tangan per baris (0-5)
var col = attack_spawn_index mod 2;       // 0=kiri, 1=kanan

var spawn_x = box_x - 40;  // Dari kiri box
var spawn_y = box_y + (row + 1) * row_spacing;

// Posisi X dalam box (kiri atau kanan dengan celah di tengah)
var horizontal_offset = 0;
if (col == 0) {
    // Tangan di 1/4 kiri
    horizontal_offset = box_width * 0.25;
} else {
    // Tangan di 3/4 kanan
    horizontal_offset = box_width * 0.75;
}

// Spawn bullet Round 2
var bullet = instance_create_depth(spawn_x, spawn_y, -50, o_enemy_bullet_2);

attack_spawn_index++;

// Reset ke baris pertama setelah 12 tangan (6 baris x 2)
if (attack_spawn_index >= 12) {
    attack_spawn_index = 0;
}

// Delay: 0.4 detik per tangan
alarm[2] = room_speed * 0.4;