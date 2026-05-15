if (attack) {
	global.player_hp -= 1;
	var dir = point_direction(other.x, other.y, x, y);
	x += lengthdir_x(10, dir);
	y += lengthdir_y(10, dir);
	
	attack = false;
	alarm[0] = attack_delay;
}

if (attack) {
    global.player_hp -= 1;
    
    part_particles_create(global.part_sys, other.x, other.y, global.part_blood, 10);
    
    var dir = point_direction(other.x, other.y, x, y);	
	x += lengthdir_x(5, dir);
	y += lengthdir_x(5, dir);
    
    attack = false;
    alarm[0] = attack_delay;
}