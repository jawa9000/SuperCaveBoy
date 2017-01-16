/// take damage
if (state != hurt_state) {
    // play hurt sound
    audio_emitter_pitch(audio_em, random_range(1.2, 1.6)); // raise the pitch up in a random range of 1.2 through 1.6
    audio_emitter_gain(audio_em, random_range(1.2, 1.6)); // audio loudness
    audio_play_sound_on(audio_em, snd_ouch, false, 8);

    image_blend = make_colour_rgb(220,150,150);
    vspd = -12;
    hspd = (sign(x - other.x) * 10); // push player when hit
    move(obj_solid); // move the player accordingly
    state = hurt_state;
}

if (instance_exists(obj_playerStats)) { // player loses one heart (hp)
    obj_playerStats.hp -= 1;
}
