/// boss_lift_state()

image_index = 1; // show second image state

if (vspd >= -16) {
    vspd -= 0.5;
}

move(obj_solid);

// check if boss is high enough in the air to start chasing the player
if (place_meeting(x, y - 32, obj_solid)) {
    vspd = 0; state = boss_chase_state;
}
