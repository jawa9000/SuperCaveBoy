/// boss_smash_state()

// move boss down unless he's already there
if (!place_meeting(x, y + 1, obj_solid)) {
    if (vspd < 16) {
        vspd += 2;
    }
    move(obj_solid);
} else {
    state = boss_stall_state;
    alarm[0] = room_speed;
    audio_play_sound(snd_step, 8, false);
    
    // if touching lava, take damage
    if (position_meeting(x, y, obj_lava)) {
        hp -= 1; // lose one hp
        audio_play_sound(snd_snake, 9, false); // damage sound
    }
}
