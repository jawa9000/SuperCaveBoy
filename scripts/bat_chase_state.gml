/// bat_chase_state

// get the direction to the player
if (instance_exists(obj_player)) {
    // get direction
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    hspd = lengthdir_x(spd, dir);
    vspd = lengthdir_y(spd, dir);
    
    // change to flying sprite
    sprite_index = spr_bat_fly;
    
    // face the sprite to the correct direction
    if (hspd != 0) {
        image_xscale = sign(hspd);
    }
    
    // move
    move(obj_solid);
}
