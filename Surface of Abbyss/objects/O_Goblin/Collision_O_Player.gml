if (attack) {
	global.player_hp -= 1;
	var dir = point_direction(other.x, other.y, x, y);
	x += lengthdir_x(10, dir);
	y += lengthdir_y(10, dir);
	
	attack = false;
	alarm[0] = attack_delay;
}