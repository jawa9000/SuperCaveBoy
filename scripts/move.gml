/// move(collision_object)

var collision_object = argument0;

// Collisions
if (place_meeting(x+hspd, y, collision_object)) {
    while (!place_meeting(x + sign(hspd), y, collision_object)) { // move the player right up to an object
        x += sign(hspd);
    }
    hspd = 0;
}
if (place_meeting(x, y+vspd, obj_solid)) {
    while (!place_meeting(x, y + sign(vspd), collision_object)) { // move the player right up to an object
        y += sign(vspd);
    }
    vspd = 0;
}



// Move the player
x += hspd; // move player left/right
y += vspd; // move player up/down
