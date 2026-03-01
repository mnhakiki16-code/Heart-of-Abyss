draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i=0; i < ds_list_size(global.inv); i++) {
	//draw_text(view_xport[0] + 10, view_yport[0] + 50 + (i*20), "Owned" + global.inv[| i]);	
}