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

	if (right) {
		x_speed = movement_speed;
		sprite_index = S_Player_Run_right;
	} else if (left) {
		x_speed = -movement_speed;
		sprite_index = S_Player_Run_left;
	} else {
		sprite_index = S_Player;
	}

	if (place_meeting(x, y+1, O_SolidApplier)) {
		if (y_speed > 0) y_speed = 0;
		if (up) {
			y_speed = -5;
		} 
	}

	move_and_collide(x_speed, y_speed, O_SolidApplier);

	if (y > room_height || y < 0 || x > room_width || x < 0) { 
	    room_restart();
	}

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
		sprite_index = S_Player_Run_right;
	} else if (left) {
		x_speed = -movement_speed;
		sprite_index = S_Player_Run_left;
	} else if (up) {
		y_speed = -movement_speed;
		sprite_index = S_Player_Run_up;
	} else if (down) {
		y_speed = movement_speed;
		sprite_index = S_Player_Run_down;
	} else {
		sprite_index = S_Player;
	}
	
	move_and_collide(x_speed, y_speed, Wall_union);
	
	if (mouse_check_button(mb_left)) {
		
		if (!audio_is_playing(AttackSound)) {
			audio_play_sound(AttackSound, 10, true);	
		}
		
		var range = 24;
		var target = instance_nearest(mouse_x, mouse_y, O_Goblin);
		
		if (target != noone) {
			if (point_distance(x, y, target.x, target.y) <= range) {
				with (target) {
					hp -= 1; 
					image_blend = c_red;
					alarm[1] = 5;
				}
			}
		}
		if (instance_exists(target)) {
			if (point_distance(x, y, target.x, target.y) <= range) {
			    with (target) {
			        hp -= 1;
			        image_blend = c_red;
			        alarm[1] = 5;
			        part_particles_create(global.part_sys, x, y, global.part_blood, 8);
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

if(global.shop) exit;