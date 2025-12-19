// o_class_controller - Create Event

// SET GUI SIZE SAMA DENGAN ROOM
display_set_gui_size(1366, 768);

// Fade in transition
if (!instance_exists(o_transition)) {
    var trans = instance_create_depth(0, 0, -9999, o_transition);
    trans.state = "fade_in";
    trans.fade_alpha = 1;
}

// Start cutscene setelah 1 detik
alarm[0] = room_speed * 1;