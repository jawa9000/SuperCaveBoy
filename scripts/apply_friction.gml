/// apply_friction(amount)

var amount = argument[0];

// check if player is moving
if (hspd != 0) {
    // check the absolute value of hspd
    if (abs(hspd) - amount > 0) {
        hspd -= amount * image_xscale;
    } else {
        hspd = 0;
    }
}
