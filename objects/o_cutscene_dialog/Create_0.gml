// o_cutscene_dialog - Create Event

// Setup dialog
dialog_active = true;
dialog_index = 0;
dialog_text = "";
dialog_speaker = "";
typed_len = 0;
text_speed = 0.5;

// Freeze player
with (Object_Player) {
    can_move = false;
}

// Array dialog
dialog_list = [
    ["Bagas", "Dam, mana uangnya? Kan sudah kusuruh kamu bawah, kan?"],
    ["Adam", "Sudah kubilang gak bisa untuk hari ini."],
    ["Adam", "Ibuku kesusahan kerjanya."],
    ["Adam", "Mungkin kalau minggu depan gimana?"],
    ["Bagas", "Haduh, anak ini. Oklah, kalau gitu minggu depan pasti, ya."],
    ["Bagas", "Tapi untuk hari ini, aku mau kamu jadi ngelakukan sesuatu."],
    ["Adam", "Ngelakukan apa?"],
    ["Bagas", "Aku mau kau jadi karung pasir tinjuku."],
    ["Adam", "Huh?"]
];

dialog_total = array_length(dialog_list);

// Load dialog pertama
dialog_speaker = dialog_list[0][0];
dialog_text = dialog_list[0][1];

// Box settings - HARDCODE UNTUK 1366x768
box_width = 1166;  // 1366 - 200
box_height = 180;
box_x = 100;
box_y = 538;  // 768 - 180 - 50

padding = 30;