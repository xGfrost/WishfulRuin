// o_fight_transition - Step Event

if (state == "fade_out") {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        state = "wait";
        wait_timer = room_speed * 1; // tunggu 1 detik
    }
}
else if (state == "wait") {
    wait_timer--;
    if (wait_timer <= 0) {
        state = "go_to_fight";
        room_goto(room_fight); // GANTI NAMA ROOM FIGHT KAMU
    }
}