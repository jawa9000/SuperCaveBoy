/// snake_move_right_state

// detect when to switch directions
var wall_at_right = place_meeting(x + 1, y, obj_solid);
var ledge_at_right = !position_meeting(bbox_right + 1, bbox_bottom + 1, obj_solid); // check if there is a ledge to the right

if (wall_at_right ||  ledge_at_right) {
    state = snake_move_left_state;
}

// Control the snake sprite
image_xscale = 1;

// Move the snake
x += 1;
