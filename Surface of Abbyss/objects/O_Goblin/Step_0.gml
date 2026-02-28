//cek player status (in here/not)
if (instance_exists(O_Player)) {
	var dist = distance_to_object(O_Player);
	
	if (dist < range_detection) {
		var dir = point_direction(x, y, O_Player.x, O_Player.y);
		
		var x_speed = lengthdir_x(movement_speed, dir);
		var y_speed = lengthdir_y(movement_speed, dir);
		
		if (!place_meeting(x + x_speed, y, Wall_union)) x += x_speed;
		if (!place_meeting(x, y + y_speed, Wall_union)) y += y_speed;
	}
}

if (hp <= 0) {
	instance_destroy();
}