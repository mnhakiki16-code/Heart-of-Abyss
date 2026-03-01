
draw_set_alpha(1);

var _bw = 300; 
var _bh = 25;  
var _margin_top = 20; 

var _bx = (display_get_gui_width() / 2) - (_bw / 2);
var _by = _margin_top;

var _hp_percent = (global.player_hp / global.player_hp_max) * 100;

draw_healthbar(_bx, _by, _bx + _bw, _by + _bh, _hp_percent, c_black, c_red, c_lime, 0, true, true);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_bx + (_bw/2), _by + _bh + 5, string(global.player_hp) + " / " + string(global.player_hp_max));
draw_set_halign(fa_left);

