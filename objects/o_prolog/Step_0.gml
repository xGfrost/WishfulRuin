// o_prolog – Step Event
var full_text = body[page];
var full_len  = string_length(full_text);

// ------------ UPDATE TYPEWRITER ------------
if (typed_len < full_len) {
    typed_len += text_speed;
    var new_len = clamp(floor(typed_len), 0, full_len);
    if (new_len != last_char_index) {
        // update text yang muncul
        display_text = string_copy(full_text, 1, new_len);
        // mainkan sound kecil tiap beberapa huruf
        if (new_len mod 2 == 0) { // setiap 2 huruf
            audio_play_sound(snd_text_blip, 0, false);
        }
        last_char_index = new_len;
    }
} else {
    // sudah selesai, pastikan full text tampil
    display_text = full_text;
}

// ------------ INPUT (ENTER / CLICK) ------------
var pressed_next = keyboard_check_pressed(vk_enter) 
                   || mouse_check_button_pressed(mb_left);

if (pressed_next) {
    if (typed_len < full_len) {
        // kalau teks belum selesai, skip langsung tampil semua
        typed_len      = full_len;
        display_text   = full_text;
        last_char_index = full_len;
    } else {
        // teks sudah selesai → ganti halaman
        page++;
        if (page >= pages_total) {
            // GANTI KE CLASS_ROOM
            room_goto(Class_Room); // ← GANTI INI (hapus room_goto(room0);)
        } else {
            // reset typewriter untuk halaman berikutnya
            typed_len        = 0;
            display_text     = "";
            last_char_index  = 0;
        }
    }
}
