// o_prolog – Create Event

// ----------------- PAGE SETUP -----------------
page = 0;
pages_total = 2; // CUMA SAMPAI HALAMAN 1

font_title = font_main;
font_body  = font_main;

// ----- HALAMAN 0 -----
title[0] = "PROLOG";
body[0]  =
"NAMAKU... TIDAK PENTING. AKU HANYA SISWA SMA BIASA YANG HIDUPNYA... MEMBOSANKAN.\n\n" +
"SETIAP HARI SAMA SAJA. SEKOLAH, PULANG, TIDUR, REPEAT. TIDAK ADA YANG SPESIAL. TIDAK ADA YANG MENARIK.\n\n" +
"ORANG-ORANG DI SEKOLAH SEOLAH TIDAK MELIHATKU. AKU SEPERTI BAYANGAN. SEPERTI TIDAK ADA.";

// ----- HALAMAN 1 -----
title[1] = "PROLOG";
body[1]  =
"MALAM INI, SEPERTI BIASA, AKU TIDUR DENGAN PERASAAN KOSONG.\n\n" +
"TAPI KALI INI BERBEDA...\n\n" +
"UNTUK PERTAMA KALINYA, AKU BERMIMPI.";

// ----------------- TYPEWRITER SETUP -----------------
text_speed = 0.2;
typed_len = 0;
display_text = "";
last_char_index = 0;

// ----------------- BGM -----------------
bgm_id = audio_play_sound(snd_prolog_bgm, 1, true);
