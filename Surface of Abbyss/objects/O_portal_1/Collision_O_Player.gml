if (!place_meeting(x,y, O_Platform_Layer2)) {
	room_goto(Room_Monster_1);	
}

if (global.game_mode == "dungeon") {
	room_goto(Room_Main);
	global.game_mode = "platformer";
}