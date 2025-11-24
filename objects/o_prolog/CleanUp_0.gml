// o_prolog – Cleanup Event

if (audio_is_playing(bgm_id)) {
    audio_stop_sound(bgm_id);
}
