//global input
var left	= keyboard_check(ord("A")) || keyboard_check(vk_left);
var right	= keyboard_check(ord("D")) || keyboard_check(vk_right);
var up		= keyboard_check(ord("W")) || keyboard_check(vk_up);
var down	= keyboard_check(ord("S")) || keyboard_check(vk_down) ;


if (global.game_mode == "platformer") {
	
	if (!audio_is_playing(Main_BGM)) {
		audio_stop_sound(Fight_BGM);
		audio_play_sound(Main_BGM, 10, true);	
	}
	
	x_speed = 0;
	y_speed += grav;

	//movement
	if (right) {
		x_speed = movement_speed; //right
		image_xscale = 1;
	} else if (left) {
		x_speed = -movement_speed; //left
	    image_xscale = -1;
	}
	//up + (ground check)
	if (place_meeting(x, y+1, O_SolidApplier)) {
		if (y_speed > 0) y_speed = 0;
		if (up) {
			y_speed = -5;
		} 
	}

	//collision check
	move_and_collide(x_speed, y_speed, O_SolidApplier);

	// corner case when the char is outside the room
	if (y > room_height || y < 0 || x > room_width || x < 0) { 
	    room_restart();
	}

	//block destruction -> mouse detection
	if (mouse_check_button_pressed(mb_left)) {
		var range = 24;
		if (point_distance(x, y, mouse_x, mouse_y) <= range) {
			var pos = instance_position(mouse_x, mouse_y, O_SolidApplier);
			if (pos != noone) {
				instance_destroy(pos);
				y_speed += grav;
			}
		}
	}

	if (mouse_check_button_pressed(mb_left)) {
		var pos = instance_position(mouse_x, mouse_y, O_reset_pos);
	
		if (pos != noone) {
			x = 80;
			y = 48;
			y_speed = 0;
		}
	}
} 

if (global.game_mode == "dungeon") {
	
	if (!audio_is_playing(Fight_BGM)) {
		audio_stop_sound(Main_BGM);
		audio_play_sound(Fight_BGM, 10, true);	
	}
	
	x_speed = 0;
	y_speed = 0;
	
	if (right) {
		x_speed = movement_speed;
		//x += x_speed; //sementara
		image_xscale = 1;
	} else if (left) {
		x_speed = -movement_speed;
		//x += x_speed; //sementara
		image_xscale = -1;
	}
	
	if (up) {
		y_speed = -movement_speed;
		//y += y_speed; //sementara
	} else if (down) {
		y_speed = movement_speed;
		//y += y_speed; //semenytara
	}
	
	/*
	if (x_speed != 0 && y_speed != 0) {
		var dist = sqrt(sqr(x_speed) + sqr(y_speed));
		x_speed = (x_speed / dist) * movement_speed;
		y_speed = (y_speed / dist) * movement_speed;
	}
	*/
	move_and_collide(x_speed, y_speed, Wall_union);
	
	if (mouse_check_button(mb_left)) {
		var range = 24;
		var target = instance_nearest(mouse_x, mouse_y, O_Goblin);
		
		if (target != noone) {
			if (point_distance(x, y, target.x, target.y) <= range) {
				with (target) {
					hp -= 1; //SEMENTARA
					image_blend = c_red;
					alarm[1] = 5;
				}
			}
		}
	}
}

if (global.player_hp <= 0) {
	room_goto(Room_Main);
	global.game_mode = "platformer";
	global.player_hp = global.player_hp_max;
}

