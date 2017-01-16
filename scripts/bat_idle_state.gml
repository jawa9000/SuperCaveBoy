/// bat_idle_state()

image_index = spr_bat_idle;

// look for player
if (instance_exists(obj_player)) {
    var dis = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (dis < sight) {
        state = bat_chase_state;
    }
}
