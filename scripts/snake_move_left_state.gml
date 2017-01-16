/// snake_move_left_state

// detect when to switch directions
var wall_at_left = place_meeting(x - 1, y, obj_solid);
var ledge_at_left = !position_meeting(bbox_left - 1, bbox_bottom + 1, obj_solid); // check if there is a ledge to the right

if (wall_at_left ||  ledge_at_left) {
    state = snake_move_right_state;
}

// Control the snake sprite
image_xscale = -1;

// Move the snake
x -= 1;
