var stat = video_get_status();
if (stat == video_status_closed) {
	room_goto(Room_Main);
	global.game_mode = "platformer";
}