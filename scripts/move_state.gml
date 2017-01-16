/// move_state()

// apply gravity
if (!place_meeting(x, y + 1, obj_solid)) { // if player is in the air
    vspd += grav; // on every frame/step, move the player down by the value of grav (gravity)
    
    // player is in air
    sprite_index = spr_player_jump;
    image_speed = 0; // don't animate the jump sprite
    image_index = (vspd > 0);
    
    // control jump height
    if (up_release && vspd < -6) {
        vspd = -6;
    }
} else {
    vspd = 0;
    
    // player is on the ground
    if (hspd == 0) { // player is standing still
        sprite_index = spr_player_idle;
    } else { // player is walking
        sprite_index = spr_player_walk
        image_speed = 0.6;
    }
    
    // only allow jump if player is touching the ground
    if (up) {
        vspd = -16;
        // play jump sound
        audio_play_sound(snd_jump, 5, false); // sound, priority, loop
    }
}


// player controls
// set player speed right
/*
if (right) {
    hspd = spd;
    hspd_dir 1;
}
// set player speed left
if (left) {
    hspd = -spd;
    hspd_dir = -1;
}
*/

if (right || left) {
    hspd += (right - left) * acc; // player move speed * acceleration
    hspd_dir = right - left;
    if (hspd > spd) { // limit max speed to right
        hspd = spd;
    }
    if (hspd < -spd) { // limit max speed to left
        hspd = -spd   
    }
} else { // set friction
    apply_friction(acc);
}


if (hspd != 0) { // flip sprite scale
    image_xscale = sign(hspd);
}
// set player speed up
/*if (up) {
    vspd = -spd;
}
// set player speed down
if (down) {
    vspd = spd
}*/

/*if (down && !place_meeting(x, y + spd, obj_solid)) {
    y += spd;
}*/


// ground friction
/*
if (!right && !left) { // if not pressing right/left, stop
    hspd = 0;
}
*/

move(obj_solid);

// play landing sound
if (place_meeting(x, y + vspd + 1, obj_solid) && vspd > 0) {
    audio_emitter_pitch(audio_em, random_range(0.8, 1.2));
    audio_emitter_gain(audio_em, random_range(0.15, 0.25));
    audio_play_sound_on(audio_em, snd_step, false, 6);
}

// check for ledge grab state
// if the player is falling and there is a block to either the right or left, grab it
var falling = y - yprevious > 0; // determine if player is falling
var wasnt_wall = !position_meeting(x + 17 * image_xscale, yprevious, obj_solid); // determine if there isn't an wall
var is_wall = position_meeting(x + 17 * image_xscale, y, obj_solid); // determine if there is a wall

if (falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    // move to the ledge
    while (!place_meeting(x + image_xscale, y, obj_solid)) {
        x += image_xscale;
    }
    // make the ledge grab height consistant
    while (position_meeting(x + 17 * image_xscale, y - 1, obj_solid)) {
        y -= 1;
    }
    
    // change sprite to ledge grab
    sprite_index = spr_player_edge_grab
    
    state = ledge_grab_state;
    
    // play ledge grab sound
    audio_emitter_pitch(audio_em, random_range(1.3, 1.6));
    audio_emitter_gain(audio_em, random_range(0.15, 0.25));
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
