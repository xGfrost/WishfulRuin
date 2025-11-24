switch (menu_index) {
    case 0:
        // START
        room_goto(room_prolog);
        break;

    case 1:
        // LOAD (nanti kamu isi sendiri)
        break;

    case 2:
        // EXIT
        game_end();
        break;
}
