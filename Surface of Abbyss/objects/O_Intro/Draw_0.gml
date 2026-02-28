var data = video_draw();
var status = data[0];

if (status == 0) {
	var surface = data[1];
	draw_surface(surface, 0, 0);
}