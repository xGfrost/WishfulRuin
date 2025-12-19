// o_cutscene_dialog - Step Event

if (!dialog_active) exit;

var full_len = string_length(dialog_text);

// Typewriter effect
if (typed_len < full_len) {
    typed_len += text_speed;
    
    // Sound effect setiap 2 huruf
    if (floor(typed_len) mod 2 == 0 && floor(typed_len) != floor(typed_len - text_speed)) {
        audio_play_sound(snd_text_blip, 0, false);
    }
}

// Input untuk next dialog
var pressed_next = keyboard_check_pressed(vk_enter) 
                   || keyboard_check_pressed(vk_space)
                   || mouse_check_button_pressed(mb_left);

if (pressed_next) {
    if (typed_len < full_len) {
        // Skip typewriter
        typed_len = full_len;
    } else {
        // Next dialog
        dialog_index++;
        
        if (dialog_index >= dialog_total) {
            // Dialog selesai
            dialog_active = false;
            
            // Unfreeze player
            with (Object_Player) {
                can_move = true;
            }
            
            instance_destroy();
        } else {
            // Load dialog berikutnya
            dialog_speaker = dialog_list[dialog_index][0];
            dialog_text = dialog_list[dialog_index][1];
            typed_len = 0;
        }
    }
}