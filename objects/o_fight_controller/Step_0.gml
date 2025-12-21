// o_fight_controller - Step Event

switch(battle_state) {
    case "menu":
        // Navigasi menu utama
        if (keyboard_check_pressed(vk_left)) {
            menu_selection--;
            if (menu_selection < 0) menu_selection = 2;
            audio_play_sound(snd_text_blip, 0, false);
        }
        if (keyboard_check_pressed(vk_right)) {
            menu_selection++;
            if (menu_selection > 2) menu_selection = 0;
            audio_play_sound(snd_text_blip, 0, false);
        }
        
        // Pilih menu
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            switch(menu_selection) {
                case 0: // FIGHT
                    battle_state = "enemy_select";
                    enemy_selection = 0;
                    break;
                    
                case 1: // ITEM
                    battle_state = "item_select";
                    item_selection = 0;
                    break;
                    
                case 2: // ACT
                    battle_state = "act_select";
                    act_selection = 0;
                    break;
            }
            audio_play_sound(snd_text_blip, 0, false);
        }
        break;
    
    case "enemy_select":
        // Pilih enemy (untuk sekarang cuma 1: Bagas)
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            battle_state = "fight_bar";
            fight_bar_active = true;
            fight_bar_x = 400;
            fight_bar_direction = 1;
            audio_play_sound(snd_text_blip, 0, false);
        }
        
        // Cancel
        if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
            battle_state = "menu";
            audio_play_sound(snd_text_blip, 0, false);
        }
        break;
        
    case "fight_bar":
        if (fight_bar_active) {
            var bar_center = display_get_gui_width() / 2;
            var bar_left = bar_center - 250;
            var bar_right = bar_center + 250;
            
            // Moving bar
            fight_bar_x += fight_bar_speed * fight_bar_direction;
            
            // Bounce
            if (fight_bar_x > bar_right) fight_bar_direction = -1;
            if (fight_bar_x < bar_left) fight_bar_direction = 1;
            
            // Attack
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
                fight_bar_active = false;
                
                // Hitung damage
                var distance = abs(fight_bar_x - bar_center);
                var damage = 0;
                
                if (distance < 30) damage = 15; // Perfect
                else if (distance < 60) damage = 10; // Good
                else if (distance < 100) damage = 5; // OK
                else damage = 2; // Miss
                
                enemy_hp -= damage;
                
                if (enemy_hp <= 0) {
                    enemy_hp = 0;
                    show_message("You defeated Bagas!");
                    room_goto(Class_Room);
                } else {
                    start_enemy_attack();
                }
            }
        }
        break;
        
    case "item_select":
        // Cek kalau inventory kosong
        if (array_length(inventory) == 0) {
            // Tidak ada item, tampilkan pesan
            // (dihandle di Draw GUI)
            
            // Tekan ENTER atau ESC untuk kembali
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) ||
                keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
                battle_state = "menu";
                audio_play_sound(snd_text_blip, 0, false);
            }
        } else {
            // Ada item, navigasi
            if (keyboard_check_pressed(vk_up)) {
                item_selection--;
                if (item_selection < 0) item_selection = array_length(inventory) - 1;
                audio_play_sound(snd_text_blip, 0, false);
            }
            if (keyboard_check_pressed(vk_down)) {
                item_selection++;
                if (item_selection >= array_length(inventory)) item_selection = 0;
                audio_play_sound(snd_text_blip, 0, false);
            }
            
            // Use item
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
                var heal_amount = inventory[item_selection][1];
                player_hp += heal_amount;
                if (player_hp > player_hp_max) player_hp = player_hp_max;
                
                // Hapus item dari inventory
                array_delete(inventory, item_selection, 1);
                if (item_selection >= array_length(inventory)) item_selection = 0;
                
                start_enemy_attack();
            }
            
            // Cancel
            if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
                battle_state = "menu";
                audio_play_sound(snd_text_blip, 0, false);
            }
        }
        break;
        
    case "act_select":
        // Navigasi ACT options
        if (keyboard_check_pressed(vk_up)) {
            act_selection--;
            if (act_selection < 0) act_selection = array_length(act_options) - 1;
            audio_play_sound(snd_text_blip, 0, false);
        }
        if (keyboard_check_pressed(vk_down)) {
            act_selection++;
            if (act_selection >= array_length(act_options)) act_selection = 0;
            audio_play_sound(snd_text_blip, 0, false);
        }
        
        // Pilih ACT
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            act_count++;
            
            if (act_count >= act_needed) {
                show_message("You spared Bagas!");
                room_goto(Class_Room);
            } else {
                start_enemy_attack();
            }
        }
        
        // Cancel
        if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
            battle_state = "menu";
            audio_play_sound(snd_text_blip, 0, false);
        }
        break;
        
    case "enemy_attack":
        // Dihandle oleh alarm
        break;
}