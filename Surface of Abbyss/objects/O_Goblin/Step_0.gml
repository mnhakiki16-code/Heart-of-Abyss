
//cek player status (in here/not)
if (instance_exists(O_Player)) {
	var dist = distance_to_object(O_Player);
	
	if (dist < range_detection) {
		var dir = point_direction(x, y, O_Player.x, O_Player.y);
		
		var x_speed = lengthdir_x(movement_speed, dir);
		var y_speed = lengthdir_y(movement_speed, dir);
		
		move_and_collide(x_speed, y_speed, [Wall_union, O_Player]);
	}
}

if (hp <= 0) {
	if (!audio_is_playing(DeadSound)) {
		audio_play_sound(DeadSound, 10, true);	
	}
	instance_destroy();
}

if (instance_exists(O_Player)) {
    var dist = distance_to_object(O_Player);
    
    if (dist < range_detection && dist > 5) {
        var dir = point_direction(x, y, O_Player.x, O_Player.y);
        var x_speed = lengthdir_x(movement_speed, dir);
        var y_speed = lengthdir_y(movement_speed, dir);
        
        move_and_collide(x_speed, y_speed, Wall_union);
    }
}