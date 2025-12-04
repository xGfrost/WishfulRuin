// o_prolog – Create Event

// ----------------- PAGE SETUP -----------------
page = 0;
pages_total = 2; // CUMA SAMPAI HALAMAN 1

font_title = font_main;
font_body  = font_main;

// ----- HALAMAN 0 -----
title[0] = "";
body[0]  =
"Kadang aku bertanya, apa sebenarnya tujuan hidupku?\n\n" +
"Hari-hariku cuma rutinitas yang tidak berubah. Sekolah, pulang, tidur... lalu diulang lagi. Tidak ada yang spesial. Tidak ada yang benar-benar menarik.\n\n" +
"Di titik ini, aku mulai bertanya... apakah hidupku memang cuma seperti ini?";

// ----- HALAMAN 1 -----
title[1] = "";
body[1]  =
"Aku ingin menemukan sesuatu.\n\n" +
"Sesuatu yang menarik. Sesuatu yang bisa membuat jantungku berdetak kencang seolah aku benar-benar hidup di dunia ini!\n\n" +
"Dan pada suatu malam... sesuatu yang menarik terjadi...";

// ----------------- TYPEWRITER SETUP -----------------
text_speed = 0.2;
typed_len = 0;
display_text = "";
last_char_index = 0;

// ----------------- BGM -----------------
bgm_id = audio_play_sound(snd_prolog_bgm, 1, true);
