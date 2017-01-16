/// boss_idle_state()

// check distance to player
var dis = point_distance(x, y, obj_player.x, obj_player.y);

if (dis <= 128) {
    state = boss_lift_state; // change boss state
    if (!audio_is_playing(snd_music)) {
        audio_emitter_gain(audio_em, 0.5);
        audio_play_sound_on(audio_em, snd_boss_music, true, 10);
    }
}
