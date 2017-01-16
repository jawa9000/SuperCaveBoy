/// spider_idle_state

// as soon as the player is close to the player, which to jump state
if (instance_exists(obj_player)) {
    var dis = distance_to_object(obj_player);
    
    if (dis < sight && alarm[0] <= 0) { // if player is in range and timer <= 0
        image_speed = 0.5;
        
        // face the player
        if (obj_player.x != x) {
            image_xscale = sign(obj_player.x-x);
        }
    }
}
