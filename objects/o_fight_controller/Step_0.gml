// o_fight_controller - Step Event

switch(battle_state) {
    case "menu":
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
        
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            switch(menu_selection) {
                case 0:
                    battle_state = "enemy_select";
                    enemy_selection = 0;
                    break;
                case 1:
                    battle_state = "item_select";
                    item_selection = 0;
                    break;
                case 2:
                    battle_state = "act_select";
                    act_selection = 0;
                    break;
            }
            audio_play_sound(snd_text_blip, 0, false);
        }
        break;
    
    case "enemy_select":
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            battle_state = "fight_bar";
            fight_bar_active = true;
            fight_bar_x = 400;
            fight_bar_direction = 1;
            audio_play_sound(snd_text_blip, 0, false);
        }
        
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
            
            fight_bar_x += fight_bar_speed * fight_bar_direction;
            
            if (fight_bar_x > bar_right) fight_bar_direction = -1;
            if (fight_bar_x < bar_left) fight_bar_direction = 1;
            
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
                fight_bar_active = false;
                
                var distance = abs(fight_bar_x - bar_center);
                var damage = 0;
                var hit_type = "";
                
                if (distance < 20) {
                    damage = 6;
                    hit_type = "perfect";
                }
                else if (distance < 80) {
                    damage = 4;
                    hit_type = "good";
                }
                else if (distance < 250) {
                    damage = 2;
                    hit_type = "ok";
                }
                else {
                    damage = 0;
                    hit_type = "miss";
                }
                
                enemy_hp -= damage;
                show_debug_message("Hit: " + hit_type + " | Damage: " + string(damage));
                
                if (enemy_hp <= 0) {
                    enemy_hp = 0;
                    audio_stop_sound(bgm_fight);  // STOP BGM
                    show_message("You defeated Bagas!");
                    room_goto(Class_Room);
                } else {
                    start_enemy_attack();
                }
            }
        }
        break;
        
    case "item_select":
        if (array_length(inventory) == 0) {
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) ||
                keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
                battle_state = "menu";
                audio_play_sound(snd_text_blip, 0, false);
            }
        } else {
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
            
            if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
                var heal_amount = inventory[item_selection][1];
                player_hp += heal_amount;
                if (player_hp > player_hp_max) player_hp = player_hp_max;
                
                array_delete(inventory, item_selection, 1);
                if (item_selection >= array_length(inventory)) item_selection = 0;
                
                start_enemy_attack();
            }
            
            if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
                battle_state = "menu";
                audio_play_sound(snd_text_blip, 0, false);
            }
        }
        break;
        
    case "act_select":
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
        
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            act_count++;
            
            if (act_count >= act_needed) {
                audio_stop_sound(bgm_fight);  // STOP BGM
                show_message("You spared Bagas!");
                room_goto(Class_Room);
            } else {
                start_enemy_attack();
            }
        }
        
        if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X"))) {
            battle_state = "menu";
            audio_play_sound(snd_text_blip, 0, false);
        }
        break;
        
    case "enemy_attack":
        break;
}
