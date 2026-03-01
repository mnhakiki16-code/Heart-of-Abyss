var stat = video_get_status();
if (stat == video_status_closed) {
	room_goto(Ending);
}