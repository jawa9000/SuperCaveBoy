/// get input

// Control player (instance variables)
// default to the keyboard
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up);
up_release = keyboard_check_released(vk_up);
down = keyboard_check(vk_down);

// if gamepad is available, use it but the keyboard overrides
var gp_id = 0; // gamepad 0
var thresh = 0.5; // gamepad threshold

if (gamepad_is_connected(gp_id)) {
    up = gamepad_button_check_pressed(gp_id, gp_shoulderr); // gamepad up
    up_release = gamepad_button_check_released(gp_id, gp_shoulderr);
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
    down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
    
}

//gamepad_axis_value(device, axisIndex) // analog sticks
// gp_shoulderr = right shoulder button
