/// hurt_state()

// player freezes
//image_blend = c_red; // draw player with red color overlay

// set sprint for damage
sprite_index = spr_player_hurt;

// face the player the right direction
if (hspd != 0) {
    image_xscale = sign(hspd);
}

// apply gravity
if (!place_meeting(x, y + 1, obj_solid)) {
    vspd += grav;
} else {
    vspd = 0;
    // apply friction
    apply_friction(acc);
}

direction_move_bounce(obj_solid);

// change back to the move state
if (hspd == 0 && vspd == 0) {
    image_blend = c_white;
    // check player's health
    if (obj_playerStats.hp <= 0) { // restart at current room
        obj_playerStats.sapphires = 0;
        obj_playerStats.hp = obj_playerStats.maxhp;
        if (audio_is_playing(snd_boss_music)) {
            audio_stop_sound(snd_boss_music);
        }
        room_restart();
    }
    state = move_state;
}
